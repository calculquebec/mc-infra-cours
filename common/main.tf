terraform {
  required_version = ">= 1.4.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.38.0"
    }
  }
}

variable "pool" {
  description = "Slurm pool of compute nodes"
  default = []
}

variable "TFC_WORKSPACE_NAME" { type = string }
variable "tfe_token" {}
variable "cloud_name" { type = string }
variable "prometheus_password" {}
variable "credentials_hieradata" { default= {} }

data "tfe_workspace" "current" {
  name         = var.TFC_WORKSPACE_NAME
  organization = "CalculQuebec"
}

locals {
  default_pod = {
    image_cpu = "AlmaLinux-9" # snapshot-cpunode-2024.1"
    image_gpu = "AlmaLinux-9" #"snapshot-gpunode-2024.1"
    ncpu = 0
    ngpu = 0
    ncpupool = 2
    ngpupool = 0
    home_size = 100
    project_size = 100
    scratch_size = 100
    cluster_purpose = "cours_academiques"
    config_version = "426612b"
  }
  default = {
    instances_map = {
      arbutus = {
          mgmt   = { type = "p8-12gb", tags = ["puppet", "mgmt", "nfs"], count = 1 }
          login  = { type = "c2-7.5gb-31-avx2", tags = ["login", "public", "proxy"], count = 1 }
          #login  = { type = "p4-6gb-avx2", tags = ["login", "public", "proxy"], count = 1 }
          nodecpu   = {
            type = "c8-30gb-186-avx2",
            tags = ["node"],
            count = try(local.custom.ncpu, local.default_pod.ncpu),
            image = try(local.custom.image_cpu, local.default_pod.image_cpu),
          }
          nodecpupool   = {
            type = "c8-30gb-186-avx2",
            tags = ["node", "pool"],
            count = try(local.custom.ncpupool, local.default_pod.ncpupool),
            image = try(local.custom.image_cpu, local.default_pod.image_cpu),
          }
          nodegpu   = {
            type = "g1-8gb-c4-22gb",
            tags = ["node"],
            count = try(local.custom.ngpu, local.default_pod.ngpu),
            image = try(local.custom.image_gpu, local.default_pod.image_gpu),
          }
          nodegpupool   = {
            type = "g1-8gb-c4-22gb",
            tags = ["node", "pool"],
            count = try(local.custom.ngpupool, local.default_pod.ngpupool),
            image = try(local.custom.image_gpu, local.default_pod.image_gpu),
          }
      }
      beluga = {
          mgmt   = { type = "p4-7.5gb", tags = ["puppet", "mgmt", "nfs"], count = 1 }
          login  = { type = "p4-7.5gb", tags = ["login", "public", "proxy"], count = 1 }
          nodecpu   = {
            type = "c8-60gb",
            tags = ["node"],
            count = try(local.custom.ncpu, local.default_pod.ncpu),
            image = try(local.custom.image_cpu, local.default_pod.image_cpu),
          }
          nodecpupool   = {
            type = "c8-60gb",
            tags = ["node", "pool"],
            count = try(local.custom.ncpupool, local.default_pod.ncpupool),
            image = try(local.custom.image_cpu, local.default_pod.image_cpu),
          }
          nodegpu   = {
            type = "gpu32-240-3450gb-a100x1",
            tags = ["node"],
            count = try(local.custom.ngpu, local.default_pod.ngpu),
	    mig = { "3g.20gb" = 1, "2g.10gb" = 1, "1g.5gb" = 2 }
            image = try(local.custom.image_gpu, local.default_pod.image_gpu),
	    disk_size = "50"
          }
          nodegpupool   = {
            type = "gpu32-240-3450gb-a100x1",
            tags = ["node", "pool"],
            count = try(local.custom.ngpupool, local.default_pod.ngpupool),
	    mig = { "1g.5gb" = 7 }
            image = try(local.custom.image_gpu, local.default_pod.image_gpu),
	    disk_size = "50"
          }
      }
    }
    volumes_map = {
      arbutus = {
        nfs = {
          home     = { size = try(local.custom.home_size, local.default_pod.home_size) }
          project  = { size = try(local.custom.project_size, local.default_pod.project_size) }
          scratch  = { size = try(local.custom.scratch_size, local.default_pod.scratch_size) }
        }
      }
      beluga = {
        nfs = {
          home     = { size = try(local.custom.home_size, local.default_pod.home_size), type = "volumes-ssd"  }
          project  = { size = try(local.custom.project_size, local.default_pod.project_size), type = "volumes-ec"  }
          scratch  = { size = try(local.custom.scratch_size, local.default_pod.scratch_size), type = "volumes-ec"  }
        }
      }
    }
  }

  instances = try(local.custom.instances, local.default.instances_map[var.cloud_name])
  volumes = try(local.custom.volumes, local.default.volumes_map[var.cloud_name])
  cluster_purpose = try(local.custom.cluster_purpose, local.default_pod.cluster_purpose)
  config_version = try(local.custom.config_version, local.default.config_version)

  hieradata = yamlencode(merge(
    {
      "profile::slurm::controller::tfe_token" =  var.tfe_token
      "profile::slurm::controller::tfe_workspace" = data.tfe_workspace.current.id
      "cluster_name" = local.name
      "prometheus_password" = var.prometheus_password
      "cloud_name" = var.cloud_name
      "cluster_purpose" = local.cluster_purpose
    },
    var.credentials_hieradata,
    yamldecode(file("../common/config.yaml")),
    yamldecode(file("config.yaml"))
  ))
}

module "openstack" {
  source         = "git::https://github.com/ComputeCanada/magic_castle.git//openstack?ref=14.0.0-alpha"
  config_git_url = "https://github.com/ComputeCanada/puppet-magic_castle.git"
  config_version = local.config_version

  cluster_name = local.name
  domain       = "calculquebec.cloud"
  image        = "Rocky-8"

  instances = local.instances

  # var.pool is managed by Slurm through Terraform REST API.
  # To let Slurm manage a type of nodes, add "pool" to its tag list.
  # When using Terraform CLI, this parameter is ignored.
  # Refer to Magic Castle Documentation - Enable Magic Castle Autoscaling
  pool = var.pool

  volumes = local.volumes

  generate_ssh_key = true
  public_keys = compact(concat(split("\n", file("../common/sshkeys.pub")), ))

  nb_users = 1
  # Shared password, randomly chosen if blank
  guest_passwd = ""

  hieradata = local.hieradata
}

output "accounts" {
  value = module.openstack.accounts
}

output "public_ip" {
  value = module.openstack.public_ip
}

# Uncomment to register your domain name with CloudFlare
module "dns" {
  source           = "git::https://github.com/ComputeCanada/magic_castle.git//dns/cloudflare?ref=14.0.0-alpha"
  bastions         = module.openstack.bastions
  name             = module.openstack.cluster_name
  domain           = module.openstack.domain
  public_instances = module.openstack.public_instances
  ssh_private_key  = module.openstack.ssh_private_key
  sudoer_username  = module.openstack.accounts.sudoer.username
}

output "hostnames" {
  value = module.dns.hostnames
}

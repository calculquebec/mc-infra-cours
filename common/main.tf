terraform {
  required_version = ">= 1.4.0"
}

variable "pool" {
  description = "Slurm pool of compute nodes"
  default = []
}

variable "TFC_WORKSPACE_NAME" { type = string }
variable "token_hieradata" {}
variable "cloud_name" { type = string }

data "tfe_workspace" "current" {
  name         = var.TFC_WORKSPACE_NAME
  organization = "CalculQuebec"
}

locals {
  image_cpu = local.custom_image_cpu ? local.custom_image_cpu : "snapshot-cpunode-2024.1"
  image_gpu = local.custom_image_gpu ? local.custom_image_gpu : "snapshot-gpunode-2024.1"
  ncpu = local.custom_ncpu ? local.custom_ncpu : 0
  ngpu = local.custom_gcpu ? local.custom_gcpu : 0
  ncpupool = local.custom_ncpupool ? local.custom_ncpupool : 2
  ngpupool = local.custom_gcpupool ? local.custom_gcpupool : 2

  default_instances_map = {
    arbutus = {
        mgmt   = { type = "p8-12gb", tags = ["puppet", "mgmt", "nfs"], count = 1 }
        login  = { type = "p4-6gb-avx2", tags = ["login", "public", "proxy"], count = 1 }
        nodecpu   = { type = "c8-30gb-186-avx2", tags = ["node"], count = local.ncpu, image=local.image_gpu }
        nodegpu   = { type = "g1-8gb-c4-22gb", tags = ["node"], count = local.ngpu, image=local.image_gpu }
        nodepoolgpu   = { type = "g1-8gb-c4-22gb", tags = ["node", "pool"], count = local.ngpupool, image=local.image_gpu }
        nodepoolcpu   = { type = "c8-30gb-186-avx2", tags = ["node", "pool"], count = local.ncpupool, image=local.image_gpu }
    }
    beluga = {
        mgmt   = { type = "p4-7.5gb", tags = ["puppet", "mgmt", "nfs"], count = 1 }
        login  = { type = "p4-7.5gb", tags = ["login", "public", "proxy"], count = 1 }
        nodecpu   = { type = "c8-60gb", tags = ["node"], count = local.ncpu, image=local.image_gpu }
        nodepoolcpu   = { type = "c8-60gb", tags = ["node", "pool"], count = local.ncpupool, image=local.image_cpu }
    }
  }
  default_instances = local.default_instances_map[var.cloud_name]

  home_size = local.custom_home_size ? local.custom_home_size : 100
  project_size = local.custom_project_size ? local.custom_project_size : 100
  scratch_size = local.custom_scratch_size ? local.custom_scratch_size : 100
  default_volumes_map = {
    arbutus = {
      nfs = {
        home     = { size = local.home_size }
        project  = { size = local.project_size }
        scratch  = { size = local.scratch_size }
      }
    }
    beluga = {
      nfs = {
        home     = { size = local.home_size, type = "volumes-ssd"  }
        project  = { size = local.project_size, type = "volumes-ec"  }
        scratch  = { size = local.scratch_size, type = "volumes-ec"  }
      }
    }
  }
  default_volumes = local.default_volumes_map[var.cloud_name]

  hieradata = yamlencode(merge(
    var.token_hieradata,
    {
      "profile::slurm::controller::tfe_workspace" = data.tfe_workspace.current.id
    },
    yamldecode(file("../common/config.yaml")),
    yamldecode(file("config.yaml"))
  ))
}

module "openstack" {
  source         = "git::https://github.com/ComputeCanada/magic_castle.git//openstack?ref=13.3.1"
  config_git_url = "https://github.com/ComputeCanada/puppet-magic_castle.git"
  config_version = "13.3.1"

  cluster_name = local.name
  domain       = "calculquebec.cloud"
  image        = "Rocky-8"

  instances = local.instances ? local.instances : local.default_instances

  # var.pool is managed by Slurm through Terraform REST API.
  # To let Slurm manage a type of nodes, add "pool" to its tag list.
  # When using Terraform CLI, this parameter is ignored.
  # Refer to Magic Castle Documentation - Enable Magic Castle Autoscaling
  pool = var.pool

  volumes = local.volumes ? local.volumes : local.default_volumes

  generate_ssh_key = true
  public_keys = compact(concat(split("\n", file("../common/sshkeys.pub")), ))

  nb_users = 0
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
  source           = "git::https://github.com/ComputeCanada/magic_castle.git//dns/cloudflare?ref=13.3.1"
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

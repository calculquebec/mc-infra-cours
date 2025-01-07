locals {
  custom = {
    nnodes = {
      cpu = 1
      cpupool = 1
      gpu = 1
      gpupool = 16
    }

    shard = {
      gpu = 12
    }
    mig = {
      gpu = { null }
    }

#    home_size = 100
#    project_size = 100
#    scratch_size = 50
    image_cpu = "snapshot-cpunode-2025-A9.4-1"
    image_gpu = "snapshot-gpunode-2025-A9.4-1"

#    config_git_url = "https://github.com/mboisson/puppet-magic_castle.git"
    config_version = "b9b05ca"

    instances_type_map = {
      juno = {
        gpu = "gpu12-120-850gb-a100x1_MC"
        gpupool = "gpu12-120-850gb-a100x1_MC"
      }
    }

    volumes = {
      nfs = {
        home = { size = 50, quota = "1g" }
        project = { size = 50 }
	scratch = { size = 50, quota = "4g" }
      }
    }
  }

  name = "test-mc-infra-cours"
}

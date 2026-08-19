locals {
  custom = {
    nnodes = {
      cpu = 1
      cpupool = 1
      gpu = 1
      gpupool = 1
      gpupool16 = 1
    }

    mig = {
      juno = {
        gpu = { "3g.20gb" = 2 }
      }
    }
    user_quotas_sizes = {
      home = "3g"
    }
    user_quotas_inodes = {
      project = "500000"
    }

    home_size = 100
    project_size = 1000
    scratch_size = 50
    image_map = {
      cpu = "AlmaLinux-9"
      gpu = "AlmaLinux-9"
    }
#    image_map = {
#      cpupool = "AlmaLinux-9"
#      gpupool = "AlmaLinux-9"
#    }

    #config_git_url = "https://github.com/mboisson/puppet-magic_castle.git"
    #config_version = "a3d5b02"

    instances_type_map = {
      juno = {
        gpu = "gpu12-120-850gb-a100x1_MC"
        gpupool = "gpu12-120-850gb-a100x1_MC"
      }
    }

  }

  name = "test-mc-infra-cours"
}

locals {
  custom = {
    nnodes = {
      cpu = 1
      cpupool = 0
      gpu = 1
      gpupool = 16
      gpupool16 = 1
    }

    mig = {
      gpu = { "3g.20gb" = 2 }
    }
    user_quotas = {
      home = "1g"
      project = "1g"
      scratch = "1g"
    }

    home_size = 100
    project_size = 1000
    scratch_size = 50
    image_cpu = "AlmaLinux-9"
    image_gpu = "AlmaLinux-9"

    #config_git_url = "https://github.com/mboisson/puppet-magic_castle.git"
    #config_version = "3dd7004"

    instances_type_map = {
      juno = {
        gpu = "gpu12-120-850gb-a100x1_MC"
        gpupool = "gpu12-120-850gb-a100x1_MC"
      }
    }

  }

  name = "test-mc-infra-cours"
}

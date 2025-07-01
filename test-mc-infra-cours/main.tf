locals {
  custom = {
    nnodes = {
      cpu = 1
      cpupool = 0
      gpu = 0
      gpupool = 16
      gpupool16 = 1
      login = 1
    }
    instances_type_map = {
      juno = {
        login = "c4-15gb"
        gpu = "gpu12-120-850gb-a100x1_MC"
        gpupool = "gpu12-120-850gb-a100x1_MC"
      }
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
    image_cpu = "snapshot-cpunode-2025-A9.4-1"
    image_gpu = "snapshot-gpunode-2025-A9.4-1"

    #config_git_url = "https://github.com/mboisson/puppet-magic_castle.git"
    #config_version = "3dd7004"

  }

  name = "test-mc-infra-cours"
}

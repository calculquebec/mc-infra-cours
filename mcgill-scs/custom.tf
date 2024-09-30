locals {
  custom = {
    n = {
      cpu = 0
      cpupool = 1
      gpupool16 = 1
      gpupool12 = 1
      gpupool80 = 1
    }
    home_size = 100
    project_size = 500
    scratch_size = 400

    user_quotas = {
      home = "1g"
      project = "2g"
      scratch = "4g"
    }

    image_cpu = "snapshot-cpunode-2024-R810.5"
    image_gpu = "snapshot-gpunode-2024-R810.5"

    config_version = "ef3e870"
  }

  name = "mcgill-scs"
}

locals {
  custom = {
    n = {
      cpu = 0
      cpupool = 0
      gpupool16 = 0 #16
      gpupool12 = 0 #4
      gpupool80 = 0 #8
    }
    home_size = 100
    project_size = 500
    scratch_size = 400

    user_quotas = {
      home = "1g"
      project = "2g"
      scratch = "4g"
    }

    mig = {
      gpupool16 = { "1g.5gb" = 7 }
      gpupool12 = { "3g.20gb" = 1, "4g.20gb" = 1 }
      gpupool80 = { "2g.20gb" = 3 }
    }

    image_cpu = "snapshot-cpunode-2024-R810.5"
    image_gpu = "snapshot-gpunode-2024-R810.5"

    config_version = "2972853"
  }

  name = "mcgill-scs"
}

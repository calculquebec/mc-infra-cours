locals {
  custom = {
    n = {
      cpu = 0
      cpupool = 0
      gpupool16 = 16
      gpupool12 = 4
      gpupool80 = 8
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
      gpupool12 = { "3g.20gb" = 2 }
      gpupool80 = { "2g.20gb" = 3 }
    }

    image_cpu = "snapshot-cpunode-2024-R810.5"
    image_gpu = "snapshot-gpunode-2024-R810.5"

    config_version = "dc6b37f4d2c077a37d88bf4862ba57a09eed7213"
  }

  name = "mcgill-scs"
}

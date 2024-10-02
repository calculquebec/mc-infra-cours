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
      gpupool12 = null #{ "1g.5gb" = 7 }
      gpupool16 = null #{ "3g.20gb" = 1, "4g.20gb" = 1 }
      gpupool80 = null #{ "1g.10gb" = 1, "2g.20gb" = 3 }
    }

    image_cpu = "snapshot-cpunode-2024-R810.5"
    image_gpu = "Rocky-8" #snapshot-gpunode-2024-R810.5"

    config_version = "2972853"
  }

  name = "mcgill-scs"
}

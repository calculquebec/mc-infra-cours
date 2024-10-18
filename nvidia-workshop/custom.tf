locals {
  custom = {
    n = {
      cpu = 0
      cpupool = 0
      gpu = 1
      gpupool16 = 16
      gpupool16-cq = 4
      gpupool12 = 4
      gpupool12-j = 20
      gpupool80 = 8
    }
    cluster_purpose = "internal"
    home_size = 50
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "1g"
      project = "1g"
      scratch = "1g"
    }
    
    instances_type_map = {
      juno = {
        gpu = "gpu12-120-850gb-a100x1"
      }
    }
    mig = {
      gpu = { "1g.5gb" = 7 }
      gpupool16 = { "1g.5gb" = 7 }
      gpupool16-cq = { "1g.5gb" = 7 }
      gpupool12 = { "3g.20gb" = 2 }
      gpupool12-j = { "1g.5gb" = 7 }
      gpupool80 = { "2g.20gb" = 3 }
    }

    image_cpu = "snapshot-cpunode-2024-R810.5"
    image_gpu = "Rocky-8.10"
    #image_gpu = "snapshot-gpunode-2024-R810.5"

    config_version = "dc6b37f4d2c077a37d88bf4862ba57a09eed7213"
  }

  name = "nvidia-workshop"
}

locals {
  custom = {
    nnodes = {
      cpu = 1
      cpupool = 0
      gpu = 1
      gpupool = 16
      gpupool16 = 1
    }

    user_quotas_sizes = {
      home = "50g"
      project = "1000g"
      scratch = "20000g"
    }
    user_quotas_inodes = {
      home = "500000"
      project = "1000000"
      scratch = "500000"
    }

    home_size = 100
    project_size = 1000
    scratch_size = 50
    image_cpu = "AlmaLinux-9"
    image_gpu = "AlmaLinux-9"

  }

  name = "pseudorque"
}

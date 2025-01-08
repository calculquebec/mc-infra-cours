locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 4
      cpupool = 2
    }
    home_size = 50
    project_size = 500
    scratch_size = 50

    user_quotas = {
      home = "5g"
      project = "50g"
      scratch = "5g"
    }

    image_cpu = "AlmaLinux-9.4"
    image_gpu = "AlmaLinux-9.4"

    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }
  name = "nsc7003"
}

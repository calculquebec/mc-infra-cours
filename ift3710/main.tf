locals {
  custom = {
    nnodes = {
      cpupool = 15
      gpupool = 15
    }
    home_size = 250
    project_size = 250
    scratch_size = 250

    user_quotas = {
      home = "5g"
      project = "5g"
      scratch = "5g"
    }

    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }

  name = "ift3710"
}

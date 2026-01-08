locals {
  custom = {
    nnodes = {
      cpupool = 15
      gpupool = 7
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
      gpupool = { "1g.5gb" = 7 }
    }
  }

  name = "ift3710"
}

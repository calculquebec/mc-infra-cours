locals {
  custom = {
    nnodes = {
      gpupool = 11
    }
    home_size = 400
    project_size = 250
    scratch_size = 525

    user_quotas = {
      home = "5g"
      project = "3g"
      scratch = "7g"
    }
    mig = {
      gpupool = { "1g.5gb" = 7 }
    }
  }
  name = "dmli"
}



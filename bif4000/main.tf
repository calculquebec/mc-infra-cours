locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 4
    }
    home_size = 100
    project_size = 100
    scratch_size = 100

    user_quotas = {
      home = "4g"
      project = "4g"
      scratch = "4g"
    }
    mig = {
      gpu = { "1g.5gb" = 7 }
    }
    
  }
  name = "bif4000"
}

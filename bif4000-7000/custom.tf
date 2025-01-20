locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 3
    }
    home_size = 100
    project_size = 100
    scratch_size = 100

    user_quotas = {
      home = "5g"
      project = "5g"
      scratch = "5g"
    }
    mig = {
      gpu = { "1g.5gb" = 7 }
    }
    
  }
  name = "bif4000-7000"
}

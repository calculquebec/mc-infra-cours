locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 4
    }
    home_size = 300
    project_size = 1500
    scratch_size = 100

    user_quotas = {
      home = "5g"
      project = "30g"
      scratch = "6g"
    }
    mig = {
      gpu = { "2g.10gb" = 3 }
    }
    
  }
  name = "ift6759"
}

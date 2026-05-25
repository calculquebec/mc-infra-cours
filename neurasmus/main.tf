locals {
  custom = {
    nnodes = {
      gpupool = 5
    }
    home_size = 125
    project_size = 500
    scratch_size = 250

    user_quotas = {
      home = "5g"
      project = "30g"
      scratch = "15g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
    
  }
  name = "neurasmus"
}

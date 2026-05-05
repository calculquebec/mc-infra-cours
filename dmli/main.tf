locals {
  custom = {
    nnodes = {
      gpupool = 2
    }
    home_size = 325
    project_size = 200
    scratch_size = 500

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

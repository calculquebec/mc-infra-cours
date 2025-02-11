locals {
  custom = {
    nnodes = {
      gpupool = 8
    }
    home_size = 110
    project_size = 100
    scratch_size = 50

    user_quotas = {
      home = "5g"
      project = "4g"
      scratch = "2g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
    
  }
  name = "ift6163"
}

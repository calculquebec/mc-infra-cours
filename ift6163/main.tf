locals {
  custom = {
    nnodes = {
      gpupool = 5
    }
    home_size = 100
    project_size = 100
    scratch_size = 50

    user_quotas = {
      home = "6g"
      project = "6g"
      scratch = "3g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
    
  }
  name = "ift6163"
}

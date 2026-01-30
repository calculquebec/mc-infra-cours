locals {
  custom = {
    nnodes = {
      cpupool = 21 
    }
    home_size = 100
    project_size = 400
    scratch_size = 400

    user_quotas = {
      home = "1g"
      project = "5g"
      scratch = "5g"
    }
  }

  name = "cdsiintro"
}

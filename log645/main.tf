locals {
  custom = {
    nnodes = {
      cpupool = 24
    }
    home_size = 120
    project_size = 120
    scratch_size = 120

    user_quotas = {
      home = "5g"
      project = "5g"
      scratch = "5g"
    }
  }
  name = "log645"
}
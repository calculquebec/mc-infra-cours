locals {
  custom = {
    nnodes = {
      cpupool = 12
    }
    home_size = 50
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "4g"
      project = "4g"
      scratch = "4g"
    }
  }
  name = "log645"
}

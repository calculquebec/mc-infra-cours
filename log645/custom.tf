locals {
  custom = {
    nnodes = {
      cpupool = 2
    }
    home_size = 50
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "3g"
      project = "3g"
      scratch = "3g"
    }
  }
  name = "log645"
}

locals {
  custom = {
    nnodes = {
      cpupool = 9
    }
    home_size = 50
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "5g"
      project = "5g"
      scratch = "5g"
    }
  }
  name = "log645"
}

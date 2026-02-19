locals {
  custom = {
    nnodes = {
      cpupool = 7
    }
    home_size = 100
    project_size = 200
    scratch_size = 1625

    user_quotas = {
      home = "7g"
      project = "15g"
      scratch = "125g"
    }
  }
  name = "bioc600"
}

locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 16
    }
    home_size = 100
    project_size = 100
    scratch_size = 2000

    user_quotas = {
      home = "6g"
      project = "6g"
      scratch = "125g"
    }
  }
  name = "bioc600"
}

locals {
  custom = {
    nnodes = {
      cpupool = 30
    }
    home_size = 75
    project_size = 75
    scratch_size = 75

    user_quotas = {
      home = "3g"
      project = "3g"
      scratch = "3g"
    }
  }
  name = "micm-edia"
}

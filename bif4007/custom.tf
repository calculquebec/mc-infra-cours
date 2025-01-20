locals {
  custom = {
    nnodes = {
      cpupool = 2
    }
    home_size = 50
    project_size = 100
    scratch_size = 800

    user_quotas = {
      home = "3g"
    }
  }
  name = "bif4007"
}

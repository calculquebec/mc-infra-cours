locals {
  custom = {
    nnodes = {
      cpupool = 4
    }
    home_size = 75
    project_size = 100
    scratch_size = 800

    user_quotas = {
      home = "4g"
      project = "6g"
      scratch = "60g"
    }
  }

  name = "bif4007"
}

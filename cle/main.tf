locals {
  custom = {
    nnodes = {
      cpupool = 18
    }
    home_size = 150
    project_size = 500
    scratch_size = 50

    user_quotas = {
      home = "5g"
      project = "30g"
      scratch = "3g"
    }
  }

  name = "cle"
}

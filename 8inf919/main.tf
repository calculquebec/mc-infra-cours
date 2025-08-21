locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 15
    }
    home_size = 100
    project_size = 500
    scratch_size = 250

    user_quotas_sizes = {
      home = "5g"
      project = "50g"
      scratch = "25g"
    }
  }

  name = "uqac-8inf919"
}

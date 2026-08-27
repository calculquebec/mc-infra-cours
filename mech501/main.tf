locals {
  custom = {
    nnodes = {
      cpupool = 15
    }
    home_size = 50
    project_size = 100
    scratch_size = 150

    user_quotas = {
      home = "2g"
      project = "5g"
      scratch = "10g"
    }
  }

  name = "mech501"
}

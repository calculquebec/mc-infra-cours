locals {
  custom = {
    nnodes = {
      cpupool = 18
    }
    home_size = 75
    project_size = 500
    scratch_size = 3000

    user_quotas = {
      home = "2g"
      project = "20g"
      scratch = "100g"
    }
  }

  name = "bcm2003"
}

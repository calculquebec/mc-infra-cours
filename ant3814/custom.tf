locals {
  custom = {
    nnodes = {
      cpupool = 2
    }
    home_size = 50
    project_size = 100
    scratch_size = 100

    user_quotas = {
      home = "4g"
      project = "8g"
      scratch = "8g"
    }
  }
  name = "ant3814"
}

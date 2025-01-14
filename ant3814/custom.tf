locals {
  custom = {
    nnodes = {
      cpupool = 2
    }
    home_size = 50
    project_size = 100
    scratch_size = 100

    user_quotas = {
      home = "3g"
      project = "5g"
      scratch = "5g"
    }
  }
  name = "ant3814"
}

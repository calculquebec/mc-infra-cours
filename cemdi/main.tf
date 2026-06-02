locals {
  custom = {
    nnodes = {
      cpupool = 45
    }
    home_size = 225
    project_size = 750
    scratch_size = 750

    user_quotas = {
      home = "7g"
      project = "16g"
      scratch = "16g"
    }
  }
  name = "cemdi"
}

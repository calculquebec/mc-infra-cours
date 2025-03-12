locals {
  custom = {
    nnodes = {
      cpupool = 10
    }
    home_size = 75
    project_size = 75
    scratch_size = 75

    user_quotas = {
      home = "7g"
      project = "7g"
      scratch = "7g"
    }
  }
  name = "hpc101"
}

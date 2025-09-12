locals {
  custom = {
    nnodes = {
      cpupool = 4
    }
    home_size = 240
    project_size = 240
    scratch_size = 240

    user_quotas = {
      home = "3g"
      project = "3g"
      scratch = "3g"
    }
  }
  name = "cdsi-intro-hpc"
}

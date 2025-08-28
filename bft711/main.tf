locals {
  custom = {
    nnodes = {
      cpupool = 2
    }
    home_size = 160
    project_size = 100
    scratch_size = 50

    user_quotas = {
      home = "10g"
      project = "5g"
      scratch = "3g"
    }
  }

  name = "bft711"
}

locals {
  custom = {
    nnodes = {
      cpupool = 3
    }
    home_size = 300
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "10g"
      project = "5g"
      scratch = "3g"
    }
  }

  name = "bft711"
}

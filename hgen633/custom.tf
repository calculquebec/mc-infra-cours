locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 15
    }
    home_size = 50
    project_size = 1000
    scratch_size = 100

    user_quotas = {
      home = "3g"
      project = "30g"
      scratch = "5g"
    }

    instances_type_map = {
      beluga = {
        cpu = "c8-30gb"
        cpupool = "c8-30gb"
      }
    }
  }
  name = "hgen633"
}

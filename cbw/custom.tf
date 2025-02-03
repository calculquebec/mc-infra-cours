locals {
  custom = {
    nnodes = {
      cpupool = 80
    }
    instances_type_map = {
      beluga = {
        cpupool = "c4-30gb"
      }
    }
    home_size = 2000
    project_size = 1000
    scratch_size = 200
    
    user_quotas = {
      home = "25g"
      project = "50g"
      scratch = "5g"
    }
  }
  name = "cbw"
}

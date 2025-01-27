locals {
  custom = {
    nnodes = {
      cpupool = 10
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

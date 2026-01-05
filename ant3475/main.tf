locals {
  custom = {
    nnodes = {
      cpupool = 4 
    }
    home_size = 50
    project_size = 100
    scratch_size = 100

    user_quotas = {
      home = "2g"
      project = "5g"
      scratch = "5g"
    }
  }

  name = "ant3475"
}

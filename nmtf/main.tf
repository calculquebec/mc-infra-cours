locals {
  custom = {
    nnodes = {
      cpupool = 1 
    }
    home_size = 50
    project_size = 50
    scratch_size = 50

    user_quotas = {
      home = "2g"
      project = "5g"
      scratch = "10g"
    }
  }

  name = "nmtf"
}

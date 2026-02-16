locals {
  custom = {
    nnodes = {
      cpupool = 22 
    }
    home_size = 50
    project_size = 110
    scratch_size = 250

    user_quotas = {
      home = "2g"
      project = "5g"
      scratch = "10g"
    }
  }

  name = "nmtf"
}

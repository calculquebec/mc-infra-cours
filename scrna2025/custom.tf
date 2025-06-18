locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 28
    }
    home_size = 300 
    project_size = 5500
    scratch_size = 500

    user_quotas = {
      home = "5g"
      project = "100g"
      scratch = "15g"
    }
  }
  name = "scrna2025"
}

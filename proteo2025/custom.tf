locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 20
    }
    home_size = 120
    project_size = 500
    scratch_size = 500

    user_quotas = {
      home = "2g"
      project = "8g"
      scratch = "8g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }
  name = "proteo2025"
}

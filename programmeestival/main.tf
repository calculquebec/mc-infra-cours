locals {
  custom = {
    nnodes = {
      gpupool = 6
      cpupool = 30
    }
    home_size = 250
    project_size = 1000
    scratch_size = 500

    user_quotas = {
      home = "8g"
      project = "30g"
      scratch = "16g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }
  name = "programmeestival"
}

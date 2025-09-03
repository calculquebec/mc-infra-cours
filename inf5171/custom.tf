locals {
  custom = {
    nnodes = {
      cpupool = 30
      gpupool = 10
    }
    home_size = 60
    project_size = 950
    scratch_size = 100

    user_quotas = {
      home = "2g"
      project = "30g"
      scratch = "3g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }
  name = "inf5171"
}

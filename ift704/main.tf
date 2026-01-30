locals {
  custom = {
    nnodes = {
      cpupool = 10
      gpupool = 1
    }
    home_size = 200
    project_size = 500
    scratch_size = 500

    user_quotas = {
      home = "5g"
      project = "10g"
      scratch = "10g"
    }

    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }

  name = "ift704"
}

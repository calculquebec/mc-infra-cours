locals {
  custom = {
    nnodes = {
      cpupool = 15
      gpupool = 10
    }
    home_size = 135
    project_size = 200
    scratch_size = 150

    user_quotas = {
      home = "5g"
      project = "20g"
      scratch = "20g"
    }

    mig = {
       gpupool = { "2g.10gb" = 3 }
    }
  }

  name = "inf5171"
}


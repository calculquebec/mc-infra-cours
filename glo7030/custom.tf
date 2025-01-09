locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 10
      cpupool = 3
    }
    home_size = 330
    project_size = 800
    scratch_size = 220

    user_quotas = {
      home = "3g"
      project = "6g"
      scratch = "2g"
    }

    shard = {
      gpupool = 16
    }
    mig = {
      gpupool = { "3g.20gb" = 2 }
    }
  }
  name = "glo7030"
}

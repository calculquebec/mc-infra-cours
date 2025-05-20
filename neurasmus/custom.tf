locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 10
      cpu = 0
      cpupool = 15
    }
    home_size = 250
    project_size = 1000
    scratch_size = 500

    user_quotas = {
      home = "5g"
      project = "30g"
      scratch = "15g"
    }
    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
    instances_type_map = {
      juno = {
        cpupool = "c8-30gb"
      }
    }
  }
  name = "neurasmus"
}

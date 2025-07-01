locals {
  custom = {
    nnodes = {
      gpu = 0
      gpupool = 10
      cpu = 0
      cpupool = 15
    }
    instances_type_map = {
      juno = {
        login = "c4-15gb"
      }
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
  }
  name = "neurasmus"
}

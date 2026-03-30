locals {
  custom = {
    nnodes = {
      cpupool = 6
      gpupool = 10
    }
    instances_type_map = {
      juno = {
        login = "ha4-15gb"
      }
    }
    home_size = 500
    project_size = 500
    scratch_size = 500

    user_quotas = {
      home = "5g"
      project = "5g"
      scratch = "5g"
    }

    mig = {
      gpupool = { "2g.10gb" = 3 }
    }
  }

  name = "sfucompute"
}

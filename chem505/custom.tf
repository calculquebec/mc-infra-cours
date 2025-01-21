locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 8
    }

    user_quotas = {
      home = "10g"
      project = "10g"
      scratch = "10g"
    }

    instances_type_map = {
      beluga = {
        cpu = "c2-7.5gb"
        cpupool = "c2-7.5gb"
      }
    }
  }
  name = "chem505"
}

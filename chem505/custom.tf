locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 8
    }

    user_quotas = {
      home = "20g"
      project = "20g"
      scratch = "20g"
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

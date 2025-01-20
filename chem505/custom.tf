locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 8
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

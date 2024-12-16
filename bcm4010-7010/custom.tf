locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 2
    }
    home_size = 50
    project_size = 1000
    scratch_size = 100

    instances_type_map = {
      beluga = {
        cpu = "c2-7.5gb"
        cpupool = "c2-7.5gb"
      }
    }
  }
  name = "bcm4010-7010"
}

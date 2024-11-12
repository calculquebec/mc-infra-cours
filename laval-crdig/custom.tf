locals {
  name = "laval-crdig"
  
  custom = {
    ngpu = 1
    ngpupool = 20
    instances_type_map = {
      beluga = {
        mgmt = "p4-7.5gb"
      }
    }
  }
}

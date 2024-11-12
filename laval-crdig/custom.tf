locals {
  name = "laval-crdig"
  
  custom = {
    ncpu = 1
    ngpu = 1
    ngpupool = 20
    instances_type_map = {
      beluga = {
        mgmt = "p4-7.5gb"
      }
    }
  }
}

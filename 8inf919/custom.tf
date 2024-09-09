locals {
  custom = {
    ncpu = 1
    ncpupool = 15
    ngpu = 0
    ngpupool = 0
    home_size = 100
    project_size = 1000
    scratch_size = 500

    instances_type_map = {
      beluga = {
        mgmt = "p4-7.5gb"
      }
    }
  }

  name = "uqac-8inf919"
}

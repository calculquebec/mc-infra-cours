locals {
  custom = {
    ncpu = 2
    ncpupool = 1
    ngpu = 1
    ngpupool = 1
    home_size = 100
    project_size = 100
    scratch_size = 50
  }

  name = "test-mc-infra-cours"
}
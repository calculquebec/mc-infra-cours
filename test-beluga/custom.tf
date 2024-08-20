locals {
  custom = {
    ncpu = 1
    ncpupool = 1
    ngpu = 1
    ngpupool = 1
    home_size = 100
    project_size = 100
    scratch_size = 50
    image_cpu = "AlmaLinux-9"
    image_gpu = "AlmaLinux-9"
  }

  name = "test-mc-infra-cours-beluga"
}

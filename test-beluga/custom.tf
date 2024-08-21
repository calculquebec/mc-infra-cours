locals {
  custom = {
    ncpu = 1
    ncpupool = 1
    ngpu = 1
    ngpupool = 1
    home_size = 100
    project_size = 100
    scratch_size = 50
    image_cpu = "Rocky-8"
    image_gpu = "Rocky-8"
    config_version = "a692837"
  }

  name = "test-mc-infra-cours-beluga"
}

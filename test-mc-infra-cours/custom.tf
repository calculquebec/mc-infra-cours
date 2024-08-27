locals {
  custom = {
    ncpu = 2
    ncpupool = 1
    ngpu = 2
    ngpupool = 1
    home_size = 100
    project_size = 100
    scratch_size = 50
    image_cpu = "snapshot-cpunode-2024-R810.4"
    image_gpu = "snapshot-gpunode-2024-R810.4"
  }

  name = "test-mc-infra-cours"
}

locals {
  custom = {
    nnodes = {
      cpu = 0
      cpupool = 1
      gpu = 0
      gpupool = 1
    }
#    home_size = 100
#    project_size = 100
#    scratch_size = 50
    image_cpu = "AlmaLinux-9" #snapshot-cpunode-2024-R810.5"
    image_gpu = "AlmaLinux-9" #snapshot-gpunode-2024-R810.5"

#    config_git_url = "https://github.com/mboisson/puppet-magic_castle.git"
#    config_version = "1b45e1f"
    volumes = {
      nfs = {
        home = { size = 50, quota = "1g" }
        project = { size = 50 }
	scratch = { size = 50, quota = "4g" }
      }
    }
  }

  name = "test-mc-infra-cours"
}

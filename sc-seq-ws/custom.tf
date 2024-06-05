locals {
  custom = {
    ncpu = 4
    ncpupool = 4
    ngpu = 0
    ngpupool = 0
    home_size = 100
    project_size = 100
    scratch_size = 10
    cluster_purpose = "formation"
  }
  name = "sc-seq-ws"
}

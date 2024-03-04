locals {
  custom = {
    ngpu = 1
    ngpupool = 10
    home_size = 300
    project_size = 100
    scratch_size = 10
    cluster_purpose = "hackathon"
  }

  name = "hackqc-a"
}

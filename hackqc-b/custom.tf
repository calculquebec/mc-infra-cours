locals {
  custom = {
    ngpu = 2
    ngpupool = 2
    home_size = 500
    project_size = 500
    scratch_size = 10
    cluster_purpose = "hackathon"
  }

  name = "hackqc-b"
}

locals {
  name = "laval-crdig"
  
  custom = {
    nnodes = {
      cpu = 1
      gpupool16-cq = 3
    }
    nb_users = 20
    mig = {
      gpupool16-cq = { "1g.5gb" = 7 }
    }
  }
}

locals {
  volumes = {
    nfs = {
      home     = { size = 100 }
      project  = { size = 500 }
      scratch  = { size = 50 }
    }
  }
  instances = {
    mgmt   = { type = "p8-12gb", tags = ["puppet", "mgmt", "nfs"], count = 1 }
    login  = { type = "p4-6gb-avx2", tags = ["login", "public", "proxy"], count = 1 }
    nodepool   = { type = "g1-8gb-c4-22gb", tags = ["node", "pool"], count = 10, image=local.image_gpu }
  }
  name = "ift6095"
}

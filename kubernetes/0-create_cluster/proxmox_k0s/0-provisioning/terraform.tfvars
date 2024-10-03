ssh_pubkey = "<|ssh_pubkey|>"
list_of_controllers = {
  "0" = {
    target_node      = "cloud1"
    tags             = "k0s,controller"
    name             = "0"
    storage_location = "local-lvm"
    storage_size     = 20
    ip               = "192.168.50.100"
  }
  "1" = {
    target_node      = "cloud1"
    tags             = "k0s,controller"
    name             = "1"
    storage_location = "local-lvm"
    storage_size     = 20
    ip               = "192.168.50.101"
  }
  "2" = {
    target_node      = "cloud1"
    tags             = "k0s,controller"
    name             = "2"
    storage_location = "local-lvm"
    storage_size     = 20
    ip               = "192.168.50.102"
  }
}

list_of_workers = {
  "0" = {
    target_node      = "cloud1"
    tags             = "k0s,worker"
    name             = "0"
    storage_location = "local-lvm"
    storage_size     = 50
    ip               = "192.168.50.150"
  }
  "1" = {
    target_node      = "cloud1"
    tags             = "k0s,worker"
    name             = "1"
    storage_location = "local-lvm"
    storage_size     = 50
    ip               = "192.168.50.151"
  }
  "2" = {
    target_node      = "cloud1"
    tags             = "k0s,worker"
    name             = "2"
    storage_location = "local-lvm"
    storage_size     = 50
    ip               = "192.168.50.152"
  }
  "3" = {
    target_node      = "cloud1"
    tags             = "k0s,worker"
    name             = "3"
    storage_location = "local-lvm"
    storage_size     = 50
    ip               = "192.168.50.153"
  }
  "4" = {
    target_node      = "cloud1"
    tags             = "k0s,worker"
    name             = "4"
    storage_location = "local-lvm"
    storage_size     = 50
    ip               = "192.168.50.154"
  }
}

list_of_vms = {
  "cluster_loadbalancer" = {
    target_node      = "cloud1"
    tags             = "k0s,loadbalancer"
    name             = "cluster-loadbalancer"
    desc             = "loadbalancer for the cluster"
    cores            = 1
    sockets          = 2
    memory           = 1024
    storage_location = "local-lvm"
    storage_size     = 10
    ip               = "192.168.50.245"
    onboot           = true
  }
}

cloud_image_name = "d12-cloud-template"

gateway = "192.168.50.1"

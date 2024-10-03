variable "ssh_pubkey" {
  type        = string
  description = "Generated pubkey path"
}
variable "cloud_image_name" {
  type        = string
  default     = "d12-cloud-template"
  description = "targeet node for the vm"
}
variable "gateway" {
  type        = string
  default     = "192.168.50.1"
  description = "targeet node for the vm"
}
variable "list_of_controllers" {
  type = map(object({
    target_node      = string
    tags             = string
    name             = string
    storage_location = string
    storage_size     = number
    ip               = string
  }))
}

variable "list_of_workers" {
  type = map(object({
    target_node      = string
    tags             = string
    name             = string
    storage_location = string
    storage_size     = number
    ip               = string
  }))
}

variable "list_of_vms" {
  type = map(object({
    target_node      = string
    tags             = string
    name             = string
    desc             = string
    cores            = number
    sockets          = number
    memory           = number
    storage_location = string
    storage_size     = number
    ip               = string
    onboot           = bool
    hwpass           = optional(string)
    pcie             = optional(number)
    rombar           = optional(number)
  }))
}

resource "proxmox_vm_qemu" "controllers" {
  for_each    = var.list_of_controllers
  target_node = each.value.target_node
  tags        = each.value.tags
  desc        = "VM controller ${each.value.name}"
  onboot      = true
  clone       = var.cloud_image_name 
  agent       = 0
  os_type     = "cloud-init"
  cores       = 1
  sockets     = 2
  numa        = true
  vcpus       = 0
  cpu         = "host"
  memory      = 2048
  name        = "k0s-controller${each.value.name}"
  scsihw      = "virtio-scsi-single"
  bootdisk    = "scsi0"
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 20
        }
      }
    }
  }
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ipconfig0  = "ip=${each.value.ip}/24,gw=${var.gateway}"
  ciuser     = "magus"
  cipassword = "magus"
  nameserver = var.gateway
  sshkeys    = var.ssh_pubkey
}

resource "proxmox_vm_qemu" "workers" {
  for_each    = var.list_of_workers
  target_node = each.value.target_node
  tags        = each.value.tags
  desc        = "VM controller ${each.value.name}"
  onboot      = true
  clone       = var.cloud_image_name 
  agent       = 0
  os_type     = "cloud-init"
  cores       = 4
  sockets     = 2
  numa        = true
  vcpus       = 0
  cpu         = "host"
  memory      = 8192
  name        = "k0s-worker${each.value.name}"
  scsihw      = "virtio-scsi-single"
  bootdisk    = "scsi0"
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 50
        }
      }
    }
  }
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ipconfig0  = "ip=${each.value.ip}/24,gw=${var.gateway}"
  ciuser     = "magus"
  cipassword = "magus"
  nameserver = var.gateway
  sshkeys    = var.ssh_pubkey
}

resource "proxmox_vm_qemu" "vm" {
  for_each    = var.list_of_vms
  target_node = each.value.target_node
  tags        = each.value.tags
  desc        = "VM ${each.value.desc}"
  onboot      = each.value.onboot
  clone       = var.cloud_image_name
  agent       = 0
  os_type     = "cloud-init"
  cores       = each.value.cores
  sockets     = each.value.sockets
  numa        = true
  vcpus       = 0
  cpu         = "host"
  memory      = each.value.memory
  name        = each.value.name
  scsihw      = "virtio-scsi-single"
  bootdisk    = "scsi0"
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = each.value.storage_location
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = each.value.storage_location
          size    = each.value.storage_size
        }
      }
    }
  }
  network {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ipconfig0  = "ip=${each.value.ip}/24,gw=${var.gateway}"
  ciuser     = "magus"
  cipassword = "magus"
  nameserver = var.gateway
  sshkeys    = var.ssh_pubkey
}

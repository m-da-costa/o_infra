terraform {
  required_providers {
    proxmox = {
      source  = "registry.example.com/telmate/proxmox"
      version = "9.9.9"
    }
  }
}
provider "proxmox" {
  pm_api_url    = "https://<|node_ip|>:8006/api2/json"
  pm_user       = "root@pam"
  pm_password   = "<|password_user|>"
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

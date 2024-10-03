# Create a proxmox pendrive

## Download
```
aria2c -x 16 https://enterprise.proxmox.com/iso/proxmox-ve_8.2-2.iso -o proxmox-ve_8.2-2.iso 
```

## Flash
```
sudo dd bs=1M conv=fdatasync if=./proxmox-ve_*.iso of=/dev/XYZ
```

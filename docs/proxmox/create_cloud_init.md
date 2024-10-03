# Create Cloud Init template
https://cloud.debian.org/images/cloud/
Create new vm:
```bash
qm create 1000 --memory 1024 --cores 1 --name d12-cloud-template --net0 virtio,bridge=vmbr0 --balloon 0 --numa 1 --cpu host 
```
Import disk to vm
```bash
qm importdisk 1000 /var/lib/vz/template/iso/debian-12-generic-arm64.img local-lvm
```
Plug the new harddrive
```bash
qm set 1000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1000-disk-0
```
Add cloud init to a new volume (create cloud init volume)
```bash
qm set 1000 --ide2 local-lvm:cloudinit
```
Set boot do scsi0 drive
```bash
qm set 1000 --boot c --bootdisk scsi0
```
Optional but nice create serial0 socket and add vga to it
```bash
qm set 1000 --serial0 socket --vga serial0`
```
Define ip config:
```bash
qm set 1001 --ipconfig0 ip=dhcp

```
Define as Template
```bash
qm set 1001 --template 1
```

---

# Command block
This will generate a template with id 1001 thats a Debian 12 generic cloud template. Similar, but not equal to the Cloud images from GCP and AWS.
```bash
apt update
apt install -y aria
cd /var/lib/vz/template/iso/
aria2c -x 12 https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2 -o debian-12-genericcloud-amd64.img
qm create 1001 --memory 1024 --cores 1 --name d12-cloud-template --net0 virtio,bridge=vmbr0 --balloon 0 --numa 1 --cpu host
qm importdisk 1001 /var/lib/vz/template/iso/debian-12-genericcloud-amd64.img local-lvm
qm set 1001 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1001-disk-0
qm set 1001 --ide2 local-lvm:cloudinit
qm set 1001 --boot c --bootdisk scsi0
qm set 1001 --serial0 socket --vga serial0
qm set 1001 --ipconfig0 ip=dhcp
qm set 1001 --template 1

```

---

# Destroy all
```bash
qm destroy 1001
rm /var/lib/vz/template/iso/debian-12-generic-amd64.img
```

---

# Set ssh key
```bash
ssh-keygen -f /root/.ssh/d12-cloud-template -P ""
qm set 1000 --sshkey /root/.ssh/d12-cloud-template.pub
```

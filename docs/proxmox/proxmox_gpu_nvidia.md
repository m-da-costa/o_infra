# Install nvidia drivers 
## Non sudo non remove for proxmox

```bash
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" >> /etc/apt/sources.list
apt update
apt install -y pve-headers-$(uname -r)
apt update
apt upgrade -y
```
```bash
curl -fSsL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub | gpg --dearmor | tee /usr/share/keyrings/nvidia-drivers.gpg > /dev/null 2>&1
apt update
apt install dirmngr ca-certificates software-properties-common apt-transport-https dkms curl -y
echo "deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/ /" | tee /etc/apt/sources.list.d/nvidia-drivers.list
```
```bash
apt install nvidia-driver cuda nvidia-smi nvidia-settings nvtop
```


```bash
DEBIAN_FRONTEND=noninteractive apt install -y firmware-misc-nonfree nvidia-driver
```

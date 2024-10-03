# Install nvidia Drivers
```bash
sudo rm /etc/apt/sources.list
sudo echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" > sources.list
sudo mv sources.list /etc/apt/
sudo apt update
sudo apt install -y linux-headers-$(uname -r)
sudo apt update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y firmware-misc-nonfree nvidia-driver
```
## Non sudo non remove for proxmox

```bash
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" >> /etc/apt/sources.list
apt update
apt install -y pve-headers-$(uname -r)
apt update
apt upgrade -y
DEBIAN_FRONTEND=noninteractive apt install -y firmware-misc-nonfree nvidia-driver
```
---
# Install docker
```bash
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
# Install newuidmap & newgidmap binaries
sudo sh -eux <<EOF
apt-get install -y uidmap git
EOF
dockerd-rootless-setuptool.sh install
```
---
# Docker container toolkit installation
```bash
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
```
---
# Configue Nvidia sdocker runtime
```bash
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```
# Configure nvidia runntime rootless
```bash
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place
```
---
# Test
```
docker run --rm --gpus all nvidia/cuda:12.6.0-cudnn-devel-ubuntu20.04 nvidia-smi
```

---

https://linuxcapable.com/install-nvidia-drivers-on-debian/

---
## Sources:
https://wiki.debian.org/NvidiaGraphicsDrivers

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

### Super code block
```bash
sudo rm /etc/apt/sources.list
sudo echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" > sources.list
sudo mv sources.list /etc/apt/
sudo apt update
sudo apt install linux-headers-amd64
sudo apt update
sudo apt upgrade -y
sudo apt install -y firmware-misc-nonfree nvidia-driver
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap git
EOF
dockerd-rootless-setuptool.sh install
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
systemctl --user restart docker
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place
docker run --rm --gpus all nvidia/cuda:12.6.0-cudnn-devel-ubuntu20.04 nvidia-smi

```
------

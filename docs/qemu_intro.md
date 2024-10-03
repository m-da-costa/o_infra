# Intro to QEMU

## Installing:
Arch: 
```bash
sudo pacman -S qemu (optionally "qemu-arch-extra" for more architectures)
```
Debian/Ubuntu: 
```bash
sudo apt install qemu
```
Fedora: 
```bash
sudo dnf install qemu
```

### To create a virtual image use:
```bash
qemu-img create -f qcow2 Image.img 10G
```

(create is to create an image, -f qcow2 sets the format to qcow2, Image.img is our final file and 10G is it's size)

### Launching the VM:
```bash
qemu-system-x86_64 -enable-kvm -cdrom OS_ISO.iso -boot menu=on -drive file=Image.img -m 2G
```

(-enable-kvm enables KVM, -cdrom selects an iso to load as a cd, -boot menu=on enables a boot menu, -drive file= selects a file for the drive, -m sets the amount of dedicated RAM)
(Remember! Ctrl + Alt + G to exit capture, Ctrl + Alt + F to fullscreen!)

That doesn't run so good, what can we do to improve it?

#### Basic performance options
```bash
 -cpu host  -smp 2 
```
(sets the CPU to the hosts' CPU)
(sets the numbers of cores)
#### Basic Graphics Acceleration

the `-vga` option can be used to specify one of various vga card emulators:
`qxl` offers 2D acceleration but requires kernel modules `qxl` and `bochs_drm` to be enabled:
```bash
-vga qxl
```

"virtio" works much better and supports some 3D emulation:
```bash
-vga virtio -display sdl,gl=on
```

[source](https://denshi.org)

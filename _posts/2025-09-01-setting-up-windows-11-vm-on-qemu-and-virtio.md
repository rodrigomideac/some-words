---
layout: post
title:  "Setting up Windows 11 VM on QEMU and VirtIO"
date:   2025-09-01 12:00:00 -0300
categories: programming
---


Always click apply for each change. Things to remember to configure:

- TPM to be emulated, TIS and 2.0
- Video to be virtio, 3d accelerated;
- Display to be Spice, Listen Type None and OpenGL checked
- NIC to be virtio
- Add a second CD-ROM with the virtio-win.iso
- CPUs set the topology manually
- Change disk sata to be disk virtio
- Set Q35 as chipset, and use the secboot.fd file. Manually add to the XML following the archlinux wiki the generated .fd file to be used as OVMF_VARs file (or something like that):

```
    <nvram template="/usr/share/edk2/x64/OVMF_VARS.4m.fd" templateFormat="raw" format="raw">/usr/share/edk2/x64/OVMF_VARS_4M_fedora.secboot.fd</nvram>
```

When booting, it will not find the virtio disk during installation, manually choose the one under the cd-rom and /virsto/.../amd64.

To disable the always online requirement during installation, press Shift-F10, and run OOBE/BYPASSNRO. It will reboot and next time the option to create a local user will appear.

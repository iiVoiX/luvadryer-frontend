Luvadryer Linux Distribution (ARM64/aarch64)
=============================================

Quick Start:
-----------
1. Run: ./start.sh

Troubleshooting:
---------------

If you get "cannot execute binary file: Exec format error":

1. Check your system architecture:
   uname -m
   (Should show: aarch64 or arm64)

   If you see "x86_64", you need the x64 version instead.

2. Check for missing libraries:
   ldd luvadryer | grep "not found"

3. Install missing dependencies:

   Ubuntu/Debian:
   sudo apt-get update
   sudo apt-get install libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libdrm2 libgbm1 libasound2

   Fedora/RHEL/CentOS:
   sudo dnf install gtk3 libnotify nss libXScrnSaver libXtst xdg-utils at-spi2-core libdrm mesa-libgbm alsa-lib

   Arch Linux:
   sudo pacman -S gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core libdrm mesa alsa-lib

4. Run directly:
   ./luvadryer

System Requirements:
-------------------
- Linux ARM64 (aarch64)
- glibc 2.31 or newer
- GTK 3.0 or newer
- Modern Linux distribution (Ubuntu 20.04+, Fedora 32+, etc.)

For support, visit: https://github.com/iiVoiX/luvadryer-software

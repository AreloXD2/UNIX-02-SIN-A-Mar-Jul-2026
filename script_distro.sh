#Update package list from repositories
sudo apt update
#Upgrade all installed packages to the latest versions
sudo apt upgrade
#Install required dependencies for building the Linux kernel and related tools
sudo apt install -y git vim make gcc libncurses-dev flex bison bc \ cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#Clone the Linux kernel source code (shallow clone for faster download)
git clone --depth 1 https://github.com/torvalds/linux.git
#Enter the Linux source directory
cd linux
#Launch the kernel configuration menu graphic interface
make menuconfig
#Compile the kernel using 2 parallel jobs to speed up the build process
make -j 2
#Create a directory named "boot-files" in / (requires root privileges)
sudo mkdir /boot-files
#Copy the compiled kernel image (bzImage) to the /boot-files directory (requires root privileges)
sudo cp arch/x86/boot/bzImage /boot-files/
#Change to the user's home directory (default behavior of cd)
cd 
#Clone the BusyBox source code (shallow clone for faster download)
git clone --depth 1 https://git.busybox.net/busybox
#Enter the BusyBox source directory
cd busybox
#Launch the BusyBox configuration menu (interactive interface using ncurses)
make menuconfig
#Compile BusyBox using 4 parallel jobs to speed up the build process
make -j 4
#Create a directory for the initramfs filesystem (requires root privileges)
sudo mkdir /boot-files/initramfs
#Install BusyBox into the initramfs directory using CONFIG_PREFIX
sudo make CONFIG_PREFIX=/boot-files/initramfs install
#Navigate to the initramfs directory
cd /boot-files/initramfs
#Create and edit the "init" file using vi (requires root privileges)
sudo vi init
#Specify the shell to be executed at boot
#!/bin/sh
#Launch an interactive shell
/bin/sh
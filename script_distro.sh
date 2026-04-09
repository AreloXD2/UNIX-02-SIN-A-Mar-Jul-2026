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
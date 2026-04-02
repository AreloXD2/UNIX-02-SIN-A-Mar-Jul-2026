#Changes the current directory to the root directory of the filesystem.
cd /
#Lists the contents of a directory, adding symbols to indicate file types.
ls -F 
#Updates the package list from repositories
sudo apt update
#Upgrades all installed packages to the latest versions
sudo apt upgrade
#Installs the Parted tool for disk partition management
sudo apt install parted
#Displays partition tables and filesystems in a formatted combined output
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"
#Lists all disk partitions and their details using Parted
sudo parted -l
#Shows block devices with filesystem information
lsblk -f
#Logical AND operator: runs the next command only if the previous one succeeds
&& 
# Prints a formatted separator line with newlines for better readability in terminal output
echo -e "\n---\n"
#Checks if the system is using UEFI or BIOS firmware
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"
#Logical OR operator: runs the next command only if the previous one fails
||
#Checks if the /sys/firmware/efi directory exists (used to detect UEFI systems)
[ -d /sys/firmware/efi ]
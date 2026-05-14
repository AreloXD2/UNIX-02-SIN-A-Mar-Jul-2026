# Check current system umask (default is usually 022)
umask
# Create test files (umask fails here due to ACL/shared folder restrictions)
touch archivo1
mkdir directorio1
ls -l
# SOLUTION: Move to user's home directory to bypass inherited permissions
cd ~
# Set the new umask
umask 027
# Create new test files in the clean home environment
touch archivo2
mkdir directorio2
# Verify permissions. Success: archivo2 is 640 and directorio2 is 750
ls -l
# Set strict umask (removes all permissions for group and others)
umask 077
# Create a test file (will get 600: -rw-------)
touch secreto.txt
# Create a test directory (will get 700: drwx------)
mkdir privado
# Verify the new restricted permissions applied correctly
ls -l
# Set default permission mask
umask 022
# Verify current user identity
whoami
# Create a test file with some text content
echo "Hola" > mi_archivo
# Check initial file permissions and ownership
ls -l mi_archivo
# Create a new user named luna with a home directory and zsh shell
useradd -m -s /usr/bin/zsh luna
# Transfer file ownership to the new user luna
chown luna mi_archivo
# Verify the ownership change was successful
ls -l mi_archivo
# Display the groups the current user belongs to
groups
# Create a new group named grupo_test
groupadd grupo_test
# Display groups again to verify 
groups
# Create a new empty test file
touch comun
# Check the initial owner and group of the new file
ls -l comun
# Append user luna to the supplementary group grupo_test
usermod -a -G grupo_test luna
# Change the group ownership of the file comun
chgrp grupo_test comun
# Verify the file now belongs to grupo_test instead of root
ls -l comun
# Change both owner to luna and group to grupo_test
sudo chown luna:grupo_test mi_archivo
# Verify the new user and group assignments
ls -l mi_archivo
# Add root user to the group (using root explicitly because $USER is empty)
sudo usermod -aG grupo_test root
# Create a directory and its subdirectory at once
mkdir -p proyecto/sub
# Create test files inside the new directory structure
touch proyecto/readme proyecto/sub/datos
# Recursively change owner to luna and group to grupo_test for the entire folder
chown -R luna:grupo_test proyecto
# List all files and subdirectories recursively to verify changes
ls -lR proyecto
# View the current user's numerical identity
# numerical user ID, primary group, secondary groups
id
# View all users on the system
# head command specifies the number of lines to display.
cat /etc/passwd | head -10
# Print the groups the current user belongs to
groups
# Print the groups the 'root' user belongs to
groups root
# user ID (UID)
id -u
# primary group ID (GID)
id -g
# group IDs
id -G
# grep filter the word 'root' within the content
cat /etc/group | grep root
# Create a new directory in the home folder
mkdir ~/proyecto_unix/
# List all files with detailed information in the directory
ls -la ~/proyecto_unix 
# Create a simple group
groupadd desarrolladores
# Create a group with a specific GID
groupadd -g 2000  operaciones
# Create a system group (GID < 1000)
groupadd --system servicios_web
# Verify that they were created
grep "desarrolladores\|operaciones\|servicios_web" /etc/group
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
# View the GID range on the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
# Basic syntax
# addgroup [options] group_name
# Create groups with addgroup
sudo addgroup diseño
sudo addgroup --gid 2100 marketing
sudo addgroup --system cache_web
# Verify
grep "diseño\|marketing\|cache_web" /etc/group
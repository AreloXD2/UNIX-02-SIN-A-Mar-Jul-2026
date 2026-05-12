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
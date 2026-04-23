#List all files(-l) including hidden ones (-a) with detailed info in human-readable format (-h)
ls -l -a -h
#Same as above using the combined flag version
ls -lah
#Create a directory named "-rf" (the -- prevents it from being treated as an option)
mkdir -- -rf
#Remove the directory named "-rf" using --
rmdir -- -rf
#Displays the manual page for the git-clone command
man git-clone
# I used "man git-clone" to look up detailed documentation about the command. Inside the manual, I navigated using:
#   - / to search for keywords in this case depth
#   - n to move to the next search result
#   - N to move to the previous search result
# This helped me quickly find relevant sections and understand how git clone works
--depth <depth>
           Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the
           histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.
#Grants execution permissions to everyone (owner, group, and others) for the script
chmod +x script.sh
#Grants execution permissions exclusively to the file owner
chmod u+x script.sh 
#Revokes read access for other users, restricting outside visibility
chmod o-r secreto.txt 
#Grants the owner read and write access, while denying all permissions to group and others
chmod u+rw,go-rwx privado 
#Verify file permissions and detailed file information
ls -l
#Fails because the shell evaluates the redirection (>) using standard user privileges before executing 'sudo', resulting in a 'Permission denied' error.
sudo echo "hola" > /etc/archivo_protegido
#Succeeds because 'sudo' elevates the 'tee' command to root privileges, allowing it to write the piped input into the protected file. The '> /dev/null' part safely discards the console output.
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#Writes the text to the protected file with root privileges and simultaneously prints it to the terminal screen without (/dev/null)
echo "hola" | sudo tee /etc/archivo_protegido 
#Appends the string "chao" to a protected system file using elevated privileges.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#Start an interactive login shell as the root user
sudo -i
#Terminate the current shell session and return to the previous user
exit
#Switch to the superuser (root) while preserving the current user's environment variables
sudo su
#Switch to the superuser (root) and simulate a full login, re-initializing the environment
sudo su -
#Display the value of the HOME environment variable (variable expansion)
echo "$HOME"
#Display the literal string '$HOME' without expanding the variable
echo '$HOME'
#Create a new file named hola.sh and add the shebang to specify the shell interpreter
echo '#!/bin/sh' > hola.sh
#Append an echo command to hola.sh that will print a message when executed
echo 'echo "Hola desde mi primer script"' >> hola.sh
#Read and display the content of the script file to verify its structure
cat hola.sh
#Executes the script file (requires execute permission)
./hola.sh
#Shows detailed information and permissions of the file hola.sh
ls -l hola.sh
#Grant execute permissions to the script file for the current user
chmod +x hola.sh 
#We check that the file hola.sh has chamge the permissions
ls -l hola.sh
#Runs the script hola.sh
./hola.sh
#List contents of the /etc directory
ls /etc
#Attempt to create a file in a protected directory (fails due to lack of permissions)
touch /etc/prueba.txt
#Successfully create the file using root privileges
sudo touch /etc/prueba.txt
#Create a new directory named mi_carpeta in the user's home directory
mkdir ~/mi_carpeta
#Attempt to install a package (fails due to lack of permissions and package lock)
apt install cowsay
#Successfully install the cowsay package using root privileges
sudo apt install cowsay
#Create an empty file named prueba.txt
touch prueba.txt
#Set permissions to read and write for the owner only (octal mode 600)
chmod 600 prueba.txt
#Verify the current permissions of the file
ls -l prueba.txt
#Set permissions to read/write/execute for owner, and read/execute for group/others (octal mode 755)
chmod 755 prueba.txt
#Verify the updated permissions
ls -l prueba.txt
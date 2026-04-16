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
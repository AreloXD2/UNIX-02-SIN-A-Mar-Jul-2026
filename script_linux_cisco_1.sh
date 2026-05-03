Linux course commands
#Lists the files and directories in the current working directory
ls
#Lists the contents of a specific directory (in this case, "Documents")and acts as an argument for the command
ls Documents
#Executes a well-known Easter egg in the aptitude package manager
aptitude moo
#Lists files and directories in long format, displaying detailed information like permissions, owner, size, and modification date
ls -l
#Lists files and directories in reverse alphabetical order
ls -r
#Lists files in long format and reverse alphabetical order using separate options
ls -l -r
#Lists files in long format and reverse alphabetical order using combined options
ls -rl
#Achieves the same result as -rl, showing that combined option order doesn't matter
ls -lr
#Executes the aptitude Easter egg with one level of verbosity
aptitude -v moo
#Executes the aptitude Easter egg with two combined levels of verbosity
aptitude -vv moo
#Executes the aptitude Easter egg with three combined levels of verbosity
aptitude -vvv moo
#Executes the aptitude Easter egg with two separated verbose options, achieving the same result as -vv
aptitude -v -v moo
#Prints the absolute path of the current working directory
pwd
#Change directory (cd) command: used to navigate between folders in the file system
cd
#Changes to the "Documents" directory using a simple relative path
cd Documents
#Navigates to the root directory (/) of the Linux filesystem
cd /
#Navigates back to the home directory using an absolute path
cd /home/sysadmin
#Confirms the current location after using the absolute path
pwd
#Moves into the Documents directory again to prepare for the next relative path test
cd Documents
#Navigates through multiple directories at once using a multi-level relative path
cd School/Art
#Verifies the successful navigation into the nested Art directory
pwd
# Change directory step by step: first into 'School', then into 'Art'
cd School
cd Art
#Moves up one level to the parent directory (from Art back to School) using the ".." shortcut
cd ..
#Returns directly to the user's home directory from any location using the tilde (~) shortcut
cd ~
#Lists the contents of the /var/log/ directory in long format to see file details (permissions, owner, size, timestamp)
ls -l /var/log/
#Lists the contents of /var/log in long format and sorts them by modification time (newest first)
ls -lt /var/log
#Lists the contents of /var/log in long format and sorts them by file size (largest first) using separated options
ls -l -S /var/log
#Lists the contents of /var/log in long format, sorted by size, but reverses the order (smallest first) using combined options
ls -lSr /var/log
#Lists the contents of /var/log in reverse alphabetical order
ls -r /var/log
#Switches to the root user with a full login shell environment
su -
#Exits the current root shell session and returns to the previous user (sysadmin)
exit
# Attempts to execute a privileged command (steam locomotive) as a normal user, resulting in a permission denied error
sl
#Executes the steam locomotive command with administrative privileges using sudo, without needing a new shell
sudo sl
#Navigates to the Documents directory using the tilde shortcut for the home directory
cd ~/Documents
#Lists detailed information about the hello.sh script, specifically to examine its file permissions, owner, and group
ls -l hello.sh
#Attempts to execute the script without execute permissions, resulting in a permission denied error
./hello.sh
#Grants execute permission to the user owner of the script using the symbolic method
chmod u+x hello.sh
#Verifies that the execute permission (x) has been successfully applied to the user owner
ls -l hello.sh
#Executes the script successfully from the current directory now that permissions are set
./hello.sh
#Lists all files in long format to view current ownership details for all files
ls -l
#Changes the owner of the hello.sh script to the root user, requiring administrative privileges
sudo chown root hello.sh
#Verifies the ownership change to ensure root is now the owner of the script
ls -l hello.sh
#Attempts to execute the script as a normal user, which now fails because the execute permission belongs only to the owner (root)
./hello.sh
# Executes the script successfully using sudo, temporarily gaining root privileges to match the file's owner
sudo ./hello.sh
#Displays the entire contents of a small text file (animals.txt) directly in the terminal
cat animals.txt
#Displays the entire contents of a larger text file (alpha.txt) to demonstrate how it floods the terminal output
cat alpha.txt
#Displays the first 10 lines (default behavior) of the alpha.txt file
head alpha.txt
#Displays the last 10 lines (default behavior) of the alpha.txt file
tail alpha.txt
#Displays a specific number of lines (the first 5) from the beginning of the file using the -n option
head -n 5 alpha.txt
#Displays a specific number of lines (the last 5) from the end of the file using the -n option
tail -n 5 alpha.txt
#Copies the /etc/passwd file into the current directory using the dot (.) shortcut
cp /etc/passwd .
#Lists the directory contents to verify that the passwd file was successfully copied
ls
# Returns to the user's home directory before running the dd command
cd ~
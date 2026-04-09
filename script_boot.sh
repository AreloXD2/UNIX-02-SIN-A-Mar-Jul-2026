# A new directory named “project” is created in the current location
mkdir proyecto
#Lists the files and folders in the current directory (it should display “project”)
ls
#We move to the “project” directory using a relative path
cd proyecto/
#We go back to the previous directory (leaving “project”), also using a relative path
cd ..
#We access the “project” folder directly using a full absolute path
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto
#Change to the user's home directory (default behavior of cd)
cd
#Change directory to "/home/codespace" using an absolute path
cd /home/codespace
#Change to the home directory using the "~" shortcut
cd ~
#Change to the home directory using the $HOME environment variable
cd $HOME
#Display the value of the HOME environment variable (user's home path)
echo $HOME
#Display the path of the current Bash shell being used
echo $BASH
#Display the PATH variable (directories where executables are searched)
echo $PATH
#List all files (including hidden ones) with detailed info and inode numbers(faster)
ls -lai
#Same as above, but using separated options (-l, -a, -i)(slower)
ls -l -a -i
#Open the manual page for the "ls" command
man ls
#List all files including hidden ones (same as -a) full name of the command option
ls --all
#"." refers to the current directory
.
#".." refers to the parent directory (one level up)
..
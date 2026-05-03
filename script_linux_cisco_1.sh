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
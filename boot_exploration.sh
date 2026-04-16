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
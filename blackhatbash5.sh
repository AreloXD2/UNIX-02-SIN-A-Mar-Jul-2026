#!/usr/bin/env bash
# Runs top in the foreground (interactive mode). 
top
# Runs top in the background using the ampersand (&).It frees up the terminal so the script can continue immediately.
top&
# Kills the command using ID command
Kill -9 
touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "El comando lzl falló"
echo "Hello World!" > output.txt
cat output.txt
echo "Bye World!" > output.txt
cat output.txt
echo "Bye World!" >> output.txt
cat output.txt
ls -l / &> stdout_and_stderr.txt
ls -l / &>> stdout_and_stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt
cat stdout.txt
cat stderr.txt 
lzl 2> error.txt
cat error.txt
cat < output.txt
cat << EOF
 Black Hat Bash
 by No Starch Press
EOF
ls -l / | grep "bin"
#!/bin/bash
# Specifies that the script should be executed using the Bash shell interpreter.

# Assigns the first command-line argument passed to the script to the variable FIRST_NAME.
FIRST_NAME="${1}"
# Assigns the second command-line argument passed to the script to the variable LAST_NAME.
LAST_NAME="${2}"

# Creates an empty file named output.txt.
touch output.txt

# Runs the date command in Day-Month-Year format and overwrites the output.txt file with it.
# The '>' operator clears any previous content in the file so you start fresh.
date +%d-%m-%Y > output.txt

# Prints the values of FIRST_NAME and LAST_NAME, and appends them to the end of output.txt.
# The '>>' operator adds the text on a new line without deleting the date written before.
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt

# Copies the output.txt file and creates an exact duplicate named backup.txt in the same directory.
cp output.txt backup.txt

# Displays the entire content of the output.txt file directly onto the terminal screen.
cat output.txt
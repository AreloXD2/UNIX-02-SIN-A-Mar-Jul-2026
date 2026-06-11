#!/bin/bash

# Store the first argument
USER_INPUT="${1}"

# ❶ Check if the argument is empty
if [[ -z "${USER_INPUT}" ]]; then
 # Prints an error message
 echo "You must provide an argument!"
 # Exits the script with an error code
 exit 1
 # Closes the first if statement
fi

# ❷ If it is an existing file
if [[ -f "${USER_INPUT}" ]]; then
# Prints that it is a file
 echo "${USER_INPUT} is a file."

 # ❸ Else if it is an existing directory
elif [[ -d "${USER_INPUT}" ]]; then
# Prints that it is a directory
 echo "${USER_INPUT} is a directory."

 # ❹ Else (if it is none of the above)
else
# Prints default message
echo "${USER_INPUT} is not a file or a directory."
# Closes the second if statement
fi
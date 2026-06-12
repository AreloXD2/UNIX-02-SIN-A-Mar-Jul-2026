#!/bin/bash
# Defines a variable with the name of the file to monitor
FILE="untilstop.txt"

# Creates the file if it does not exist, or updates its timestamp if it does
touch "${FILE}"

# Starts a loop that runs UNTIL the file has a size greater than zero (-s checks if file has content)
until [[ -s "${FILE}" ]]; do

 # Prints a message to the terminal stating that the file is currently empty
 echo "${FILE} is empty..."

 # Prints a message indicating that the script will wait before checking again
 echo "Checking again in 2 seconds..."

 # Pauses the script execution for 2 seconds to avoid overloading the CPU
 sleep 2

# Marks the end of the until loop code block
done

# Prints a final message once the loop ends (meaning the file is no longer empty)
echo "${FILE} appears to have some content in it!"
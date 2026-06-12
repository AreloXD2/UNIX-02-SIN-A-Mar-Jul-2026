#!/bin/bash

# Define the name of the file that will trigger the loop to stop
SIGNAL_TO_STOP_FILE="stoploop"

# Loop runs as long as the specified file does NOT exist (-f checks for file, ! negates it)
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
  # Print status messages to the terminal
  echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
  echo "Checking again in 2 seconds..."
  
  # Wait for 2 seconds before checking the condition again
  sleep 2
#Marks the end of while loop
done

# This message prints only when the file is detected and the loop breaks
echo "File was found! Exiting..."
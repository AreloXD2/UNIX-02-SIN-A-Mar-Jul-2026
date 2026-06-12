#!/bin/bash
# Loops through all files in the current directory that match the "example_file*" pattern
for file in example_file*; do

  # Checks if the current file name is exactly "example_file1"
  if [[ "${file}" == "example_file1" ]]; then

    # Prints a message indicating that this specific file is being skipped
    echo "Skipping the first file"

    # Skips the rest of the current iteration and jumps directly to the next file in the loop
    continue

  # Marks the end of the if statement block
  fi

  # Generates a random integer and overwrites the current file with that value
  echo "${RANDOM}" > "${file}"

# Marks the end of the for loop code block
done
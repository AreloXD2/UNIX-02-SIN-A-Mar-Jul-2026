#!/bin/bash

# UID (User Identifier) is a unique number for each user. UID 0 is the Root admin.
# EUID is the Effective User ID running the process right now.

# Define the check_if_root function
check_if_root(){
    # Check if Effective UID equals 0 (Root)
    if [[ "${EUID}" -eq "0" ]]; then
        # Return 0 (success/true)
        return 0
    # If UID is not 0
    else
        # Return 1 (failure/false)
        return 1
    # End of the internal if condition
    fi
# End of the function
}

# Call the function and check if it succeeds
if check_if_root; then
    # Print message for root user
    echo "User is root!"
# If the function failed
else
    # Print message for non-root user
    echo "User is not root!"
# End of the main if condition
fi
# We add a new user called luna
# adduser luna
# We verify the user
# id luna
# We change user and execute the script, the result is " User is not root!"
# su - luna
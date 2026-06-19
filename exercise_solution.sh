#!/bin/bash
# Interpret the script using the Bash shell

# Store the 1st command-line argument (e.g., site name)
NAME="${1}"

# Store the 2nd command-line argument (e.g., domain name)
DOMAIN="${2}"

# Define the output CSV file name
OUTPUT_FILE="results.csv"


# Check if either the NAME OR the DOMAIN variable is empty
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then

  # Print error message for missing arguments
  echo "You must provide two arguments to this script."

  # Print usage example using the script's own name (${0})
  echo "Example: ${0} mysite nostarch.com"

  # Exit the script with error code 1
  exit 1
fi


# Create or overwrite the CSV file with the column headers
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}


# Send 1 ping packet and hide all terminal output (&> /dev/null)
if ping -c 1 "${DOMAIN}" &> /dev/null; then

  # If ping succeeds: append success row with current date to the CSV
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"

else

  # If ping fails: append failure row with current date to the CSV
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
fi
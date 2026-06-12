#!/bin/bash
# Assigns the first argument passed to the script ($1) to the IP_ADDRESS variable
IP_ADDRESS="${1}"

# Starts a case statement to evaluate the value of the IP_ADDRESS variable
case ${IP_ADDRESS} in

 # Checks if the IP address starts with "192.168." (the asterisk acts as a wildcard)
 192.168.*)
  # Prints a message if the IP matches the 192.168.x.x network pattern
  echo "Network is 192.168.x.x"
  # Marks the end of this specific pattern block (like a break statement)
  ;;

 # Checks if the IP address starts with "10.0." followed by any characters
 10.0.*)
  # Prints a message if the IP matches the 10.0.x.x network pattern
  echo "Network is 10.0.x.x"
  # Marks the end of this specific pattern block
  ;;

 # The default or catch-all pattern, which matches anything that didn't match above
 *)
  # Prints a message when the IP address does not belong to any recognized network
  echo "Could not identify the network"
  # Marks the end of the default pattern block
  ;;

# Marks the end of the case statement block ("case" spelled backwards)
esac

#IPs:
#192.168.hola result: Newtwork is 192.168.x.x
#10.0.jajaj result: Network is 10.0.x.x
#12.0.0.1 result: Could not identify the network
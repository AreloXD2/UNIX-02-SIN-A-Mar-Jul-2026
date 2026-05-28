# Display the real and effective user ID and group ID
id
# Print only the effective group name of the current user
id  -gn
# Create an empty file named 'test_grupo_heredado.txt' in the user's home directory
touch ~/test_grupo_heredado.txt
# List detailed information for the newly created file to verify permissions and ownership
ls -la ~/test_grupo_heredado.txt
# Shows actual group
id -gn
echo "Grupo actual:$(id -gn)"
# Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt
# Install the missing packages containing the 'newgrp' command and user mapping utilities
apt install uidmap util-linux-extra
# Locate the binary path of the 'newgrp' command to verify it was successfully installed
which newgrp
# Create a new system group named 'desarrolladores'
groupadd desarrolladores
# Change to group 'desarrolladores'
newgrp desarrolladores
# Verify that the active group has changed
id -gn
echo "Nuevo grupo activo: $(id -gn)"
# Create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group is now 'desarrolladores'
# Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/
# proyecto_dev/ has the 'desarrolladores' group
# Exit the newgrp subshell
exit
# Verify that we returned to the original group
id -gn
echo "Restored group: $(id -gn)"
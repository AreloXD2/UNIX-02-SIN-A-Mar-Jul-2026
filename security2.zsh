# Display the real and effective user ID and group ID
id
# Print only the effective group name of the current user
id  -gn
# Create an empty file named 'test_grupo_heredado.txt' in the user's home directory
touch ~/test_grupo_heredado.txt
# List detailed information for the newly created file to verify permissions and ownership
ls -la ~/test_grupo_heredado.txt

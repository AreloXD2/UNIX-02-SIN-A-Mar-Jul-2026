# change directory to /dev directory
cd /dev
# List files and directories on the /dev directory
ls 
# Navigate to the /proc directory for system info
cd /proc
# Display CPU architecture and processor details
cat cpuinfo 
#Compile the C source file into an executable binary named 'saludobin'
gcc saludo.c -o saludobin
#Move the binary to the /bin directory with root privileges to make it globally executable
sudo mv saludobin /bin/
#Navigate to the /etc directory which contains system configuration files
cd /etc
#Navigate into the gss subdirectory
cd gss/


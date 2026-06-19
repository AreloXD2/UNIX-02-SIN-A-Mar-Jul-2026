#!/usr/bin/env bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt

ps | grep TTY
ps | grep -i tty

grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt

awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

awk '{print $1,$NF}' log.txt
touch example_csv.txt
echo "hola1,chao1" > example_csv.txt 
echo "hola2,chao2" >> example_csv.txt 
echo "hola3,chao3" >> example_csv.txt
awk -F',' '{print $1}' example_csv.txt

head log.txt
awk 'NR < 10' log.txt
grep "42.236.10.117" log.txt 
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt
grep "Mozilla" log.txt
grep "Godzilla" log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep 'Godzilla' newlog.txt

sed '1d' newlog.txt
sed -i '1d' newlog.txt
diff log.txt newlog.txt #Verify if line 1 was deleted
sed -i '$d' newlog.txt
diff log.txt newlog.txt #Verify if last line was deleted
sed 's/ //g' newlog.txt > newlog1.txt
cat newlog1.txt
sed '5,7d' newlog1.txt

sed -n '10,15 p' log.txt

sleep 100 &
jobs
fg %1
bg %1


# EXERCISE 2

# Grant executable permissions to the script so it can be run by the system
chmod +x exercise_solution.sh

# Run the script in the background using localhost to bypass network blocks,
# combined with 'ps' to catch the process active during its 'sleep' state.
nohup ./exercise_solution.sh prueba_sleep 127.0.0.1 & ps aux | grep exercise_solution.sh

# Search the active processes using the specific Process ID (PID)
# This avoids text clutter and false positives from other terminal windows or editors
ps aux | grep 30574

# Display the contents of the generated CSV file to verify the success output
cat results.csv

# Pause the script execution for 30 seconds
sleep 30

#!/usr/bin/env bash
set -x
bash --version
set -x
env 
set +x
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}

ps -e -f
ps -ef
df --human-readable
# bash -r blackhatbash1.sh
# bash -n blackhatbash1.sh
# bash -x script.sh
# man
set +x
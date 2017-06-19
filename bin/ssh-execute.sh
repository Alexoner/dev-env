#!/bin/sh

user=$1
host=$2

# execute local shell script
ssh -t $user@$host 'bash -s' < local_script.sh

# sudo over ssh command
#ssh -t $user@$host "sudo ls"

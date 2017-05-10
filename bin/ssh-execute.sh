#!/bin/sh

for ip in hosts
do 
	ssh user@ip 'bash -s' < local_script.sh
done

ssh user@host 'bash -s' < local_script.sh

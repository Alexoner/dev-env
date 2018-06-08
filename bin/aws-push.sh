#!/bin/sh

ip="54.65.148.129"
rsync -avL --progress -e "ssh -i '/Users/Alex/Documents/mine/credential/aws-tokyo.pem'" \
       "$1" \
       ubuntu@$ip:/home/ubuntu/Documents

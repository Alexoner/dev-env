#!/bin/sh
if [ $# -gt 0 ]; then
    ip=$1
else
    ip="54.65.148.129"
fi
ssh -i "/Users/Alex/Documents/mine/credential/aws-tokyo.pem" ubuntu@$ip

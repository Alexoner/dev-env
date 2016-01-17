#!/bin/sh
if [ $# -gt 0 ]; then
    ip=$1
else
    ip="52.69.37.169"
fi
ssh -i "/Users/Alex/Documents/mine/credential/aws-tokyo.pem" ubuntu@$ip

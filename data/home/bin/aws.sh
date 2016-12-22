#!/bin/sh
if [ $# -gt 0 ]; then
    ip=$1
else
    ip="52.193.41.186"
fi
ssh -i "/Users/Alex/Documents/mine/credential/aws-tokyo.pem" ubuntu@$ip

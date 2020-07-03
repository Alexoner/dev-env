#!/bin/bash

sudo apt install -y unzip
# bash <(curl -L -s https://install.direct/go.sh)
curl -L -O https://install.direct/go.sh
sudo bash ./go.sh

sudo systemctl start v2ray

#### enable tcp bbr
# check
sysctl net.ipv4.tcp_available_congestion_control

# modify to enable
cat <<EOF |sudo tee -a /etc/sysctl.conf
# tcp bbr
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

sudo sysctl -p

# check
sysctl net.ipv4.tcp_congestion_control
lsmod |grep tcp

# export v2ray config to base64 encoded vmess url
curl -L -O https://raw.githubusercontent.com/boypt/vmess2json/master/json2vmess.py
python3 json2vmess.py /etc/v2ray/config.json

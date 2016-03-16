#!/bin/sh

# iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -dport 80 -o seth0 -m statistic --mode nth --every 2 --packet 0 -j SNAT --to-source xxx.xxx.xxx.19
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 1 --packet 0 -j SNAT --to-source xxx.xxx.xxx.10
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 2 --packet 0 -j SNAT --to-source xxx.xxx.xxx.11
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 3 --packet 0 -j SNAT --to-source xxx.xxx.xxx.12
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 4 --packet 0 -j SNAT --to-source xxx.xxx.xxx.13
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 5 --packet 0 -j SNAT --to-source xxx.xxx.xxx.14
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 6 --packet 0 -j SNAT --to-source xxx.xxx.xxx.15
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp -o seth0 -m statistic --mode nth --every 7 --packet 0 -j SNAT --to-source xxx.xxx.xxx.16

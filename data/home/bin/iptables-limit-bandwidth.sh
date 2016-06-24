#!/bin/sh

iptables -A OUTPUT -m owner --uid-owner squid -m limit --limit 10/s -j ACCEPT
iptables -A OUTPUT -m owner --uid-owner squid  -j REJECT

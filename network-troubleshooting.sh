#!/bin/bash
echo "Checking connectivity..."
ping -c 4 $1

echo "IP Info:"
ip a

echo "Routing Table:"
ip route

echo "Network Manager Status:"
systemctl status NetworkManager --no-pager

echo "Device Status:"
nmcli dev status
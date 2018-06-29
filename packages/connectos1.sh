#!/bin/bash
sudo sed -i 's/#interface=/interface=eth0/g' /etc/dnsmasq.conf

sudo sed -i 's/#dhcp-range=192.168.0.50,192.168.0.150,12h/dhcp-range=192.168.1.50,192.168.1.150,12h/g' /etc/dnsmasq.conf

sudo systemctl stop dnsmasq

sleep 5

sudo systemctl start dnsmasq

journalctl -fu dnsmasq

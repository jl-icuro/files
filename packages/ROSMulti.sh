#!/bin/bash

read -p "Enter Computer IP Address: " SELF_IP

read -p "Enter Host Computer: " HOST_IP

echo "export ROS_IP=$SELF_IP" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://$HOST_IP:11311" >> ~/.bashrc

echo "Don't forget to source .bashrc!"

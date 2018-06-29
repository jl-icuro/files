 #!/bin/bash

xterm -e bash -c '

sudo apt-get install dnsmasq

bash ~/ros_ws/ouster_ws/src/ouster_example/ouster_ros/connectos1.sh

' &


xterm -e bash -c '

source ~/ros_ws/ouster_ws/devel/setup.bash;

read -p "Enter Ouster IP: " HOSTNAME;

read -p "Enter Computer IP: " DESTNAME;

roslaunch ouster_ros os1.launch os1_hostname:=$HOSTNAME os1_udp_dest:=$DESTNAME

' &


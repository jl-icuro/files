#!/bin/bash


xterm -e bash -c '

sudo su;

source ~/ros_ws/imu_ws/devel/setup.bash;

roslaunch rtimulib_ros rtimulib_ros.launch

' &


#!/bin/bash

xterm -e bash -c '

source ~/ros_ws/imu_ws/devel/setup.bash;

roslaunch rtimulib_ros rtimulib_ros.launch

' &
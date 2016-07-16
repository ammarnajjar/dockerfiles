#!/bin/bash

# Ubuntu 14.04 64-bit
# ROS-Indigo (the most recent update)
# SocketCAN(ESD CAN card (PLX90xx), sja1000 kernel driver)

get_sudo() {
    uid="$(id -u)"
    SUDO="sudo"
    if [[ $uid -eq 0 ]]
    then
        SUDO=""
    fi
}

get_sudo

# Initialize rosdep
$SUDO rosdep init
rosdep update

# prepare catkin workspace
mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
echo ">> Current directory: $(pwd)"
catkin_init_workspace
git clone https://github.com/ammarnajjar/ros_canopen.git -b no-lost-arbitration-handling
git clone https://github.com/ipa320/schunk_robots.git -b indigo_dev
git clone https://github.com/ammarnajjar/lwa4p_moveit_config.git
cd ..
echo ">> Current directory: $(pwd)"
rosdep install --from-paths src --ignore-src --rosdistro indigo -y

# build catkin workspace
source /opt/ros/indigo/setup.bash
catkin_make
echo "source $HOME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
source $HOME/catkin_ws/devel/setup.bash

# prepare moveit workspace
# full documentation: http://moveit.ros.org/install/
mkdir -p $HOME/moveit/src
cd $HOME/moveit/src
echo ">> Current directory: $(pwd)"

wstool init .
wstool merge https://raw.github.com/ros-planning/moveit_docs/indigo-devel/moveit.rosinstall
wstool update
cd ..
echo ">> Current directory: $(pwd)"
rosdep install --from-paths src --ignore-src --rosdistro indigo -y

# build moveit workspace
catkin_make
echo "source $HOME/moveit/devel/setup.bash" >> $HOME/.bashrc
source $HOME/moveit/devel/setup.bash

echo "Installation done successfully."

# vim: set ft=sh ts=4 sw=4 noet ai :

# Ubuntu 14.04 64-bit
# ROS-Indigo (the most recent update)
# Tested with SocketCAN(ESD CAN card (PLX90xx), sja1000 kernel driver)

FROM ubuntu:14.04

MAINTAINER "Ammar Najjar <najjarammar@gmail.com>"
LABEL Description="This image is used to make ROS Indigo based projects build faster using build tools" Version="1.0"

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

ENV DISPLAY="$DISPLAY"
ENV TERM="xterm-256color"
ENV QT_X11_NO_MITSHM=1

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git git-core vim tmux tree wget curl -y

# install ros and moveit needed packages
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
RUN apt-get update && apt-get install -y ros-indigo-desktop              \
	ros-indigo-libntcan ros-indigo-libpcan ros-indigo-controller-manager \
	ros-indigo-controller-manager-msgs ros-indigo-joint-limits-interface \
	ros-indigo-cob-srvs ros-indigo-cob-control-mode-adapter              \
	ros-indigo-cob-dashboard ros-indigo-cob-command-gui libmuparser-dev  \
	python-rosinstall python-wstool

RUN rosdep init
RUN rosdep update

# install schunk robot packages and moveit configs
COPY ./install.sh /
RUN bash install.sh

# setup environment
EXPOSE 11345

#  vim: set ft=dockerfile ts=4 sw=4 noet ai : 

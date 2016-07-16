#
# ROS Indigo with moveit, schunk_lwa4p workspace
#

FROM ros:indigo
MAINTAINER "Ammar Najjar <najjarammar@gmail.com>"

LABEL Description="This image is used to make ROS Indigo based projects build faster using build tools" Version="1.0"

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

ENV DISPLAY="$DISPLAY"
ENV TERM="xterm-256color"
ENV QT_X11_NO_MITSHM=1

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

RUN apt-get update
RUN apt-get install -y git wget ros-indigo-desktop \
	ros-indigo-libntcan ros-indigo-libpcan ros-indigo-controller-manager \
	ros-indigo-controller-manager-msgs ros-indigo-joint-limits-interface \
	ros-indigo-cob-srvs ros-indigo-cob-control-mode-adapter \
	ros-indigo-cob-dashboard ros-indigo-cob-command-gui libmuparser-dev

EXPOSE 11345

COPY ./install.sh /root/
RUN bash /root/install.sh

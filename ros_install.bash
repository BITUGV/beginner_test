#!/bin/bash
set -e  # exit on first error
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UBUNTU_CODENAME=$(lsb_release -sc)
CATKIN_WS_DIR="$HOME/catkin_ws"

main()
{
  ros_install
  create_catkin_ws
}

ros_install()
{
  if [ "${UBUNTU_CODENAME}" == "trusty" ]; then
    echo "Installing ros indigo ........."
    ROS_DISTRO="indigo"
  elif [ "${UBUNTU_CODENAME}" == "xenial" ]; then
    echo "Installing ros kinetic.........."
    ROS_DISTRO="kinetic"
  else
    echo "This is a script only for ubuntu 14.04 and 16.04."
  fi
  source $SCRIPT_DIR/identify_environment.bash

  sudo sh -c '. /etc/lsb-release && echo "deb http://ros.exbot.net/rospackage/ros/ubuntu/ xenial main" > /etc/apt/sources.list.d/ros-latest.list'
  
  echo "Updating package lists ..."
  sudo apt-get -qq update
  echo "Installing ROS $ROS_DISTRO ..."
  sudo apt-get -y install ros-$ROS_DISTRO-desktop
  sudo apt-get -qq install python-catkin-tools
  sudo apt-get -qq install ros-$ROS_DISTRO-catkin

  # check if the ros setup file is sourced.
  if [ "$ROS_DISTRO" == "kinetic" ]; then
    if (grep 'source /opt/ros/kinetic/setup.bash' $HOME/.bashrc); then
      echo "The ros setup.bash has been sourced."
    else
      echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    fi
  elif [ "$ROS_DISTRO" == "indigo" ]; then
    if (grep 'source /opt/ros/indigo/setup.bash' $HOME/.bashrc); then
      echo "The ros setup.bash has been sourced."
    else
      echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
    fi
  fi



  if [ "$ROS_DISTRO" == "kinetic" ]; then
      sudo apt-get -qq install ros-$ROS_DISTRO-opencv3 > /dev/null
  fi

  source /opt/ros/$ROS_DISTRO/setup.bash

  # Prepare rosdep to install dependencies.
  echo "Updating rosdep ..."
  if [ ! -d /etc/ros/rosdep ]; then
    sudo rosdep init
  fi

  rosdep update
  sudo apt-get -qq install python-rosinstall
}


create_catkin_ws()
{
    # Check if workspace exists
    if [ -e "$CATKIN_WS_DIR/.catkin_workspace" ] || [ -d "$CATKIN_WS_DIR/.catkin_tools" ]; then
        echo "Catkin workspace detected at ~/catkin_ws"
        rm -rf build devel install logs
    else
        echo "Creating catkin workspace in $HOME/catkin_ws ..."
        source /opt/ros/$ROS_DISTRO/setup.bash
        mkdir -p "$CATKIN_WS_DIR/src"
        cd "$CATKIN_WS_DIR"
        catkin init
        cd "$CATKIN_WS_DIR"
        catkin build
        echo "Catkin workspace created successfully."
    fi
    # check if the ros setup file is sourced.

    if (grep 'source ~/catkin_ws/devel/setup.bash' $HOME/.bashrc); then
      source $HOME/.bashrc
      echo "The ros catkin_ws/devel/setup.bash has been sourced."
    else
      echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
      source $HOME/.bashrc
    fi
    
}

# Install system dependencies listed in ROS packages' package.xml
# Note: dependencies needed on embedded systems must still be included
# separately in the repo or cross-compiled stage.

main

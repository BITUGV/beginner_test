#!/bin/bash
set -e


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{ 
  echo "Installing dependence packages....."
  # add repo for apt-get install 
  source $SCRIPT_DIR/identify_environment.bash
    
  sudo apt-get update
  sudo apt-get install -qq lua5.1 liblua5.1-0-dev libgeographic-dev \
  python-catkin-tools python-lxml python-tempita xvfb screen
  ros_version_check
  install_github_lfs
  echo "All dependences are installed."
}

install_github_lfs()
{
  rm -rf git_lfs_install
  git clone https://git.coding.net/aRagdoll/git_lfs_install.git
  cd git_lfs_install && sudo dpkg -i git-lfs_2.3.4_amd64.deb
  cd .. && rm -rf git_lfs_install
  git lfs install
}


ros_version_check()
{
  if [ -e /opt/ros/indigo/setup.bash ]; then 
	echo "Detected ROS Indigo."
  	source /opt/ros/indigo/setup.bash
  elif [ -e /opt/ros/kinetic/setup.bash ]; then
	echo "Detected ROS Kinetic."
  	source /opt/ros/kinetic/setup.bash
  else 
	echo "Failed to detected ROS version."
	echo "Start to install ROS........"
	bash $SCRIPT_DIR/ros_install.bash
  fi 
}

main

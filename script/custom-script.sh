#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
echo  "Copying local files"

cd /opt
tar -xzf /tmp/local_files.tar.gz

echo  "Install update packages"
# Install update packages
cd /opt/local_files/updates
rpm -Uvh *.rpm

echo  "Install Docker_dependency packages"
# Install Docker_dependency packages
cd /opt/local_files/docker_dependency
rpm -Uvh *.rpm

echo  "Install Docker package"
# Install Docker package
cd /opt/local_files/docker
rpm -Uvh *.rpm

echo  "Install other packages"
# Install other packages
cd /opt/local_files/packages
rpm -Uvh *.rpm

echo "Copying local Docker Images"
#Copying local Docker Images
mkdir /docker_offline_images
cd /docker_offline_images
cp /opt/local_files/images/* .

echo "Copying 'docker-compose' 'docker-machine' & 'kubectl' and adding to PATH"
#Copying 'docker-compose' 'docker-machine' & 'kubectl'
cp /opt/local_files/bin_files/* /usr/bin/.
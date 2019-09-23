#!/bin/bash

# This is compatible with only Ubuntu

root_id=0
release=`lsb_release -d | awk '{print $2, $3}'`
update=`apt-get install git -y`
#make_dir="mkdir /usr/bin/local/countdown"
path="cd /tmp"
clone_git="git clone https://github.com/metalaarif/CountdownScript.git"

if [ $root_id != $UID ]; then
	echo "You need to be root, you can use 'sudo -i' or 'su root' to become root."
	exit
fi

#echo "OS Running:" $release
#echo "Installing git ....."
#echo $update

$path
$clone_git



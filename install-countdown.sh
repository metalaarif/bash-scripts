#!/bin/bash

# This is compatible with only Ubuntu

## Making sure it needs to be run as root
root_id=0
if [ $root_id != $UID ]; then
        echo "You need to be root, Try 'sudo ./install_countdown'."
        exit
fi

## Checking the OS
release=`lsb_release -d | awk '{print $2, $3}'`
echo "OS Running:" $release

## Checking if git is installed if not it will install it. 

check_install=`dpkg --list git`
install_git=`apt-get install git -y`
echo $check_install > /dev/null

if [ $?  == 0 ]; then
	echo "Great! git is installed"
else
	echo "Installing Git...." $install_git
fi

## Creating Directory in /usr/local/bin and clone via git
path_to_bin="cd /usr/local/bin"
cloning="git clone https://github.com/metalaarif/CountdownScript.git"
$path_to_bin
$cloning

## Deleting and changing the name
`rm -rf CountdownScript/datetime.py `
`rm -rf CountdownScript/countdown.py`
`rm -rf CountdownScript/README.txt`
`mv CountdownScript/countdown.sh CountdownScript/countdown`
`chmod 777 CountdownScript/countdown`

## Setting Enviroment Variables

`touch /etc/profile.d/countdown.sh`
set_profile="/etc/profile.d/countdown.sh"
echo "#!/bin/bash" > $set_profile
echo "export PATH=/usr/local/bin/CountdownScript:$PATH" >> $set_profile



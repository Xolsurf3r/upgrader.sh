#!/bin/bash
apt-get update | grep upgraded
apt-get upgrade -y | grep upgraded
apt-get dist-upgrade -y | grep upgraded

sleep 2s

echo "Do you want to reboot? (Y/N)"

read YorN

if [ $YorN = "Y" ]
then
	echo Rebooting...
	reboot
else
	echo Goodbye
	exit 0
fi

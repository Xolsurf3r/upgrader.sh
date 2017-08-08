#!/bin/bash
echo "Do you want to install the upgrade.sh script (Y/N)"

read result

if [ $result = "Y" ]
then
	echo "Installing..."
	OUTPUT="$(pwd)"
	cp "${OUTPUT}"/upgrader.sh /bin/upgrader.sh
	chmod +x /bin/upgrader.sh
	echo "alias upgrader='./bin/upgrader.sh'" >> ~/.bash_aliases && source ~/.bash_aliases
	echo "Done"
	exit 0
else
	echo "Aborting..."
	sleep 1s
	exit 1
fi

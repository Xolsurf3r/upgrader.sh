#!/bin/bash
echo "Do you want to install the upgrade.sh script (Y/N)"

read result

if [ $result = "Y" ]
then
	echo "Installing..."
	echo "#!/bin/bash" > /bin/upgrader.sh
	echo 'apt-get update | grep "Reading package"' >> /bin/upgrader.sh
	echo "apt-get upgrade -y | grep upgraded" >> /bin/upgrader.sh
	echo "apt-get dist-upgrade -y | grep upgraded" >> /bin/upgrader.sh
	echo "" >> /bin/upgrader.sh
	echo "sleep 2s" >> /bin/upgrader.sh
	echo "" >> /bin/upgrader.sh
	echo 'echo "Do you want to reboot? (Y/N)"' >> /bin/upgrader.sh
	echo "" >> /bin/upgrader.sh
	echo "read YorN" >> /bin/upgrader.sh
	echo 'if [ $YorN = "Y" ]' >> /bin/upgrader.sh
	echo "then" >> /bin/upgrader.sh
	echo "	echo Rebooting..." >> /bin/upgrader.sh
	echo "	reboot" >> /bin/upgrader.sh
	echo "else" >> /bin/upgrader.sh
	echo "	echo Goodbye" >> /bin/upgrader.sh
	echo "	exit 0" >> /bin/upgrader.sh
	echo "fi" >> /bin/upgrader.sh
	chmod +x /bin/upgrader.sh
	echo "alias upgrader='./bin/upgrader.sh'" >> ~/.bash_aliases
	source ~/.bash_aliases
	echo "Done"
	exit 0
else
	echo "Aborting..."
	sleep 1s
	exit 1
fi
	

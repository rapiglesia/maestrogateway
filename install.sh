#!/bin/sh

if [ $(whoami) != 'root' ]; then
	echo -e "\nVous devez avoir les droits super-utilisateur pour executer $0"
	exit 1;
fi

print "Installation des dépendances"
pip install paho-mqtt
pip install websocket-client
print "Copie des fichiers necessaires"
cp maestro /etc/init.d/
chmod 0755 /etc/init.d/maestro
systemctl daemon-reload
update-rc.d maestro defaults
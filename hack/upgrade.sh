#!/bin/sh

if [ -f /download/install.sh ]; then
	rm /download/install.sh
fi

if [ -f /data/etc/upgradeurl ]; then
	DL_URL=`head -n 1 /data/etc/upgradeurl`
	echo "Downloading from " $DL_URL >> $BASEDIR/install.log
	curl $DL_URL -o /download/install.sh
else
	DL_URL=https://raw.github.com/boxeehacks/boxeehack/master/install/install.sh
fi

curl $DL_URL -o /download/install.sh
sh /download/install.sh &
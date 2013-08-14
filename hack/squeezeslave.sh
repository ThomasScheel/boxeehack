#!/bin/sh

if [ "$(pidof squeezeslave)" ]; then
	echo "Process already running! Exiting..."
	exit 1
fi

if [ $# > 1 ]; then
    if [[ "$1" = "--delay" ]]; then
		echo "Waiting for 10 seconds"
		sleep 10
    fi
fi

if [ -f /data/etc/squeezecontroller ]; then
	SC_Server=`head -n 1 /data/etc/squeezecontroller`

	if [ "$SC_Server" != "" ]; then
		/data/hack/bin/squeezeslave -R -M/var/log/squeezeslave.log -v sw -m00:00:00:00:00:03 $SC_Server
	fi
fi
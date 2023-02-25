#!/bin/sh

if [ ! -f UUID ]; then
	cat /proc/sys/kernel/random/uuid > UUID
fi

UUID=$(cat UUID)

# Set config.json
sed -i "s/PORT/$PORT/g" /etc/xray/config.json
sed -i "s/UUID/$UUID/g" /etc/xray/config.json

echo starting xray platform
echo starting with UUID:$UUID
echo listening at 0.0.0.0:$PORT

exec "$@"


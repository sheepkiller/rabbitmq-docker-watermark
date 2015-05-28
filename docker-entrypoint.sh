#!/bin/bash
set -e

[ "x${MEM}" != "x" ] && {
cat /proc/meminfo | awk -v mem=${MEM} '$1 ~ /^MemTotal/ {printf("[{rabbit, [{loopback_users, []},{vm_memory_high_watermark,%f}]}].", (( mem * 0.4 )/ ($2 / 1024)))}' > /etc/rabbitmq/rabbitmq.config
}

if [ "$1" = 'rabbitmq-server' ]; then
	chown -R rabbitmq /var/lib/rabbitmq
	set -- gosu rabbitmq "$@"
fi

exec "$@"

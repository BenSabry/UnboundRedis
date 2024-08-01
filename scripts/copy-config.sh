#!/bin/sh
echo "";
echo "$(date) $0 $@"

/bin/cp -f ./configs/redis.conf /etc/redis.conf
/bin/cp -f ./configs/unbound.conf /etc/unbound/unbound.conf


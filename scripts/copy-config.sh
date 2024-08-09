#!/bin/sh
echo ""
echo "$(date) $0 $@"

# services
/bin/cp -f ./configs/redis.conf /etc/redis.conf
/bin/cp -f ./configs/unbound.conf /etc/unbound/unbound.conf

# logrotate
echo "$(cat ./configs/logrotate.conf)" > /etc/logrotate.conf
/bin/cp -f ./configs/logrotate-log.conf /etc/logrotate.d/log
/bin/cp -f ./configs/logrotate-unbound.conf /etc/logrotate.d/unbound

# resolv
echo "$(cat ./configs/resolv.conf)" > /etc/resolv.conf

#!/bin/sh
echo ""
echo "$(date) $0 $@"

apk add redis

rm /etc/redis.conf

#!/bin/sh
echo "";
echo "$(date) $0 $@"

apk add redis
rc-update add redis

#!/bin/sh
echo ""
echo "$(date) $0 $@"

# environment
apk add build-base expat-dev bison flex libevent-dev hiredis-dev protobuf-c-dev protobuf-c-compiler libmnl-dev openssl openssl-dev pkgconfig

# permissions
adduser -D "unbound"

# make sure the service starts once 
# to correct permissions before files generation
service unbound start &> /dev/null
service unbound stop &> /dev/null

/etc/periodic/weekly/unbound-update-roothints.sh
/etc/periodic/daily/unbound-update.sh

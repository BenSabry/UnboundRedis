#!/bin/sh
echo ""
echo "$(date) $0 $@"

# environment
apk add build-base expat-dev bison flex libevent-dev hiredis-dev protobuf-c-dev protobuf-c-compiler libmnl-dev openssl openssl-dev pkgconfig

# permissions
addgroup -S unbound
adduser -S -G unbound unbound

mkdir /etc/unbound
chown -R unbound:unbound /etc/unbound

touch /etc/unbound/unbound.log
chown unbound:unbound /etc/unbound/unbound.log

mkdir /var/lib/unbound
chown -R unbound:unbound /var/lib/unbound

# service
/bin/cp -f ./configs/unbound /etc/init.d/unbound

chmod +x /etc/init.d/unbound
rc-update add unbound default

# update unbound
./scripts/unbound-update.sh

# update roothints
./scripts/unbound-update-roothints.sh

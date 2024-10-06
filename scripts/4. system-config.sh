#!/bin/sh
echo ""
echo "$(date) $0 $@"

# update nameserver to use unbound itself as DNS for local machine
echo "nameserver 127.0.0.1" > "/etc/resolv.conf"
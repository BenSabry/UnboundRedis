#!/bin/sh
echo ""
echo "$(date) $0 $@"

url="https://www.internic.net/domain/named.cache"
echo "Downloading $url"
wget -S $url -O /etc/unbound/root.hints  &> /dev/null

#!/bin/sh
echo ""
echo "$(date) $0 $@"

internet="google.com"
onlineDelay=60
offlineDelay=20

while :
do
    if ping -c 1 $internet &> /dev/null; then
        sleep $onlineDelay
        if ping -c 1 $internet &> /dev/null; then
                echo "unbound initiated"
                exit 0
        fi
    else
        echo "restarting unbound"
        service unbound restart
        sleep $offlineDelay
    fi
done

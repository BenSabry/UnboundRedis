#!/bin/sh
echo ""
echo "$(date) $0 $@"

# repositories
repo="https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community"
if ! (cat /etc/apk/repositories | grep "$repo" -q); then
    echo "$repo" >> /etc/apk/repositories
fi

# crontab
cron="@reboot                                 run-parts /etc/periodic/reboot"
if ! (crontab -l | grep "$cron" -q); then
    (crontab -l 2>/dev/null; echo "$cron") | crontab -
fi

# system
conf="net.ipv4.tcp_fastopen=3"
if ! (cat /etc/sysctl.conf | grep "$conf" -q); then
    echo "net.ipv4.tcp_fastopen=3     # Unbound: Enable TCP Fast Open - Reduces Network Latency" >> /etc/sysctl.conf
fi

conf="vm.overcommit_memory=1"
if ! (cat /etc/sysctl.conf | grep "$conf" -q); then
    echo "vm.overcommit_memory=1      # 1 Always overcommit, never check. Removes Redis Log Warning." >> /etc/sysctl.conf
fi

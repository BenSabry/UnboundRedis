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

/etc/periodic/weekly/system-upgrade.sh
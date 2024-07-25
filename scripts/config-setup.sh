echo "";
echo "$(date) $0 $@"

/bin/cp -f ./configs/redis.conf /etc/redis.conf
/bin/cp -f ./configs/unbound.conf /etc/unbound/unbound.conf

echo "" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fastopen=3     # Unbound: Enable TCP Fast Open - Reduces Network Latency" >> /etc/sysctl.conf
echo "vm.overcommit_memory=1      # 1 Always overcommit, never check. Removes Redis Log Warning." >> /etc/sysctl.conf

(crontab -l 2>/dev/null; echo "0 0 * * 5  ~/scripts/system-upgrade.sh > /dev/null") | crontab -
(crontab -l 2>/dev/null; echo "@reboot    ~/scripts/unbound-watcher.sh > /dev/null") | crontab -
(crontab -l 2>/dev/null; echo "0 0 1 * *  ~/scripts/unbound-update.sh > /dev/null") | crontab -
(crontab -l 2>/dev/null; echo "0 1 1 * *  ~/scripts/unbound-update-roothints.sh > /dev/null") | crontab -

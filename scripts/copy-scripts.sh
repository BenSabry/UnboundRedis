#!/bin/sh
echo ""
echo "$(date) $0 $@"

# create directories
mkdir ~/scripts
mkdir /etc/periodic/reboot

# copy utils scripts
/bin/cp -f ./scripts/status.sh ~/scripts/status.sh
/bin/cp -f ./scripts/monitor.sh ~/scripts/monitor.sh

# copy periodic scripts
/bin/cp -f ./scripts/unbound-init.sh /etc/periodic/reboot/unbound-init.sh
/bin/cp -f ./scripts/system-upgrade.sh /etc/periodic/weekly/system-upgrade.sh
/bin/cp -f ./scripts/unbound-update-roothints.sh /etc/periodic/monthly/unbound-update-roothints.sh
/bin/cp -f ./scripts/unbound-update.sh /etc/periodic/monthly/unbound-update.sh

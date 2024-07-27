echo "";
echo "$(date) $0 $@"

# move scripts
mkdir ~/scripts
/bin/cp -f ./scripts/system-upgrade.sh ~/scripts/system-upgrade.sh
/bin/cp -f ./scripts/unbound-update.sh ~/scripts/unbound-update.sh
/bin/cp -f ./scripts/unbound-update-roothints.sh ~/scripts/unbound-update-roothints.sh

# make scripts executable
chmod +x ~/scripts/*.sh 
chmod +x ./scripts/*.sh 

~/scripts/system-upgrade.sh

./scripts/redis-setup.sh
./scripts/unbound-env-setup.sh
./scripts/unbound-permissions-setup.sh

~/scripts/unbound-update.sh
~/scripts/unbound-update-roothints.sh

./scripts/unbound-service-setup.sh
./scripts/config-setup.sh

echo "reboot system"
reboot

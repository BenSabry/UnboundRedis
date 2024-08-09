#!/bin/sh
echo ""
echo "$(date) $0 $@"

# make scripts executable
chmod +x ./scripts/*.sh

./scripts/copy-scripts.sh
./scripts/system-config.sh
./scripts/system-upgrade.sh

./scripts/redis-setup.sh
./scripts/unbound-setup.sh
./scripts/copy-config.sh

service redis restart
service unbound restart

~/scripts/monitor.sh

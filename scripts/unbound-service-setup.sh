echo "";
echo "$(date) $0 $@"

/bin/cp -f ./configs/unbound /etc/init.d/unbound

chmod +x /etc/init.d/unbound
rc-update add unbound default

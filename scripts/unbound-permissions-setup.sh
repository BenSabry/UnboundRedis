echo "";
echo "$(date) $0 $@"

addgroup -S unbound
adduser -S -G unbound unbound

mkdir /etc/unbound
chown -R unbound:unbound /etc/unbound

touch /etc/unbound/unbound.log
chown unbound:unbound /etc/unbound/unbound.log

mkdir /var/lib/unbound
chown -R unbound:unbound /var/lib/unbound

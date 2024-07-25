echo ""
echo "$(date) $0 $@"

wget -S https://www.internic.net/domain/named.cache -O /etc/unbound/root.hints

#!/bin/sh

# variables
msg="$(unbound-control -c /etc/unbound/unbound.conf stats_noreset)"
filters="total.num.queries=|total.num.cachehits|total.num.cachemiss|total.num.prefetch|total.num.recursivereplies|total.num.expired|total.recursion"

uStats="$(echo "$msg" | grep -E "$filters")"
uPerc="$(echo "$(echo "$uStats" | grep 'total.num.cachehits=' | cut -c 21-)/$(echo "$uStats" | grep total.num.queries= | cut -c 19-)" | bc -l | cut -c 2-3;)"

rStats="$(redis-cli info memory | grep 'used.*human')";
rDbSize="$(redis-cli dbsize)"

# # messages
echo "https://github.com/BenSabry/UnboundRedis"
echo ""

echo -n "unbound"; service unbound status
echo "-------------------------"
echo "total.percent.cachehits=$uPerc%"
echo "$uStats"
echo ""

echo -n "redis"; service redis status
echo "-------------------------"
echo "redis.db.size:$rDbSize"
echo "$rStats"

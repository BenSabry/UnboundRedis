# variables
unboundStates="$(unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num)"
unboundCachePercent="$(echo "$(unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num.cachehits= | cut -c 21-)/$(unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num.queries= | cut -c 19-)" | bc -l | cut -c 2-3;)"

redisStates="$(redis-cli info memory | grep 'used.*human')";
redisDbSize="$(redis-cli dbsize)"

# messages
echo "https://github.com/BenSabry/UnboundRedis"
echo ""

echo -n "unbound"; service unbound status
echo "-------------------------"
echo "total.percent.cachehits=$unboundCachePercent%"
echo "$unboundStates"
echo ""

echo -n "redis"; service redis status
echo "-------------------------"
echo "redis.db.size:$redisDbSize"
echo "$redisStates"

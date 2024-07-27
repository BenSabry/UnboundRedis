echo "https://github.com/BenSabry/UnboundRedis";
echo "";

echo -n "unbound"; service unbound status;
echo "-------------------------";

echo -n "total.percent.cachehits="; echo -n "$(echo "$(unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num.cachehits= | cut -c 21-)/$(unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num.queries= | cut -c 19-)" | bc -l | cut -c 2-3;)"; echo "%"; 

unbound-control -c /etc/unbound/unbound.conf stats_noreset | grep total.num; echo ""; 

echo -n "redis"; service redis status; 
echo "-------------------------"; 
echo -n "redis.db.size:"; redis-cli dbsize; 
redis-cli info memory | grep 'used.*human';

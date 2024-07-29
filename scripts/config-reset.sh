echo "";
echo "$(date) $0 $@"

{
    wget https://raw.githubusercontent.com/BenSabry/UnboundRedis/main/configs/redis.conf
    wget https://raw.githubusercontent.com/BenSabry/UnboundRedis/main/configs/unbound.conf

    /bin/cp -f ./redis.conf /etc/redis.conf
    /bin/cp -f ./unbound.conf /etc/unbound/unbound.conf

} &> /dev/null

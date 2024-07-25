echo ""
echo "$(date) $0 $@"

internet="google.com"
onlineDelay=300
offlineDelay=30

while :
do
    if ping -c 1 $internet &> /dev/null; then
        echo "internet: online"
        sleep $onlineDelay
    else
        echo "internet: offline"
        service unbound restart
        sleep $offlineDelay
    fi
done

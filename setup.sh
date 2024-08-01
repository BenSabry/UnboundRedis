{
    path="/tmp/BenSabry-UnboundRedis"
    
    rm -rf $path
    mkdir $path
    cd $path

} &> /dev/null

wget https://github.com/BenSabry/UnboundRedis/archive/refs/heads/main.zip

{
    unzip main.zip
    cd UnboundRedis-main

} &> /dev/null

chmod +x setup-offline.sh
./setup-offline.sh

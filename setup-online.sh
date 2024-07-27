
echo "downloading installer ..."
path="/tmp/BenSabry-UnboundRedis"

{
    mkdir $path
    cd $path

    wget https://github.com/BenSabry/UnboundRedis/archive/refs/heads/main.zip

    unzip main.zip
    cd UnboundRedis-main
} &> /dev/null

echo "download completed"
echo "starting installer ..."

chmod +x setup.sh
./setup.sh

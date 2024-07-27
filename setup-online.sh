echo "downloading installer ..."
path="/tmp/BenSabry-UnboundRedis"

rm -rf $path
mkdir $path
cd $path

wget https://github.com/BenSabry/UnboundRedis/archive/refs/heads/main.zip

unzip main.zip
cd UnboundRedis-main

clear

chmod +x setup.sh
./setup.sh

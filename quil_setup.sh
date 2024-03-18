#!/bin/bash
sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
sudo apt update
sudo apt-get install jq git tmux speedtest-cli transmission-cli -y

sudo cp ~/quil/ceremonyclient.service /lib/systemd/system/ceremonyclient.service

curl -OL https://go.dev/dl/go1.20.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
# echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'GOROOT=/usr/local/go' >> ~/.bashrc
echo 'GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

# mkdir ~/.ssh
git clone https://github.com/QuilibriumNetwork/ceremonyclient.git

mkdir ~/ceremonyclient/node/.config

cd ~/ceremonyclient/node
GOEXPERIMENT=arenas go install  ./...

echo "y" | sudo ufw enable
sudo ufw allow 22
sudo ufw allow 8336
sudo ufw allow 8337
sudo ufw allow 443

crontab ~/quil/crontabGit

echo 'Running node in tmux for the first time to initiate config'
~/quil/tmux_node_log.sh
# echo 'Waiting 5m until restarting node...'
# sleep 5m
# sed -i 's/listenGrpcMultiaddr: ""/listenGrpcMultiaddr: \/ip4\/127.0.0.1\/tcp\/8337/' ~/ceremonyclient/node/.config/config.yml
# ~/quil/tmux_miner.sh
echo 'Restarted node after changing config.'

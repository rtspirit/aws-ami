#!/bin/bash
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sleep 30
sudo apt-get -qy update
sudo apt-get -qy upgrade
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y -q nodejs
sudo npm install pm2@latest -g
sudo apt install ruby-full -y
sudo apt install wget -y
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo curl -o /root/amazon-cloudwatch-agent.deb https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E /root/amazon-cloudwatch-agent.deb
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo dpkg --configure -a
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo apt-get install -f
sudo apt-get -qy update
sudo apt-get -qy upgrade
sudo service amazon-cloudwatch-agent start
sudo service codedeploy-agent start
sudo service codedeploy-agent status
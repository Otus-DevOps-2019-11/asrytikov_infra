#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
sudo rm /etc/apt/sources.list.d/mongodb*.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E52529D4
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma

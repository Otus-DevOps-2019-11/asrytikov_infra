#!/bin/bash
cd ~

git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

sudo touch  /etc/systemd/system/puma.service
sudo echo -e "[Unit]\nDescription=Puma service\nAfter=network-online.target network.target rsyslog.service\n[Service]\nType=simple\nWorkingDirectory=/home/ak/reddit\nExecStart=/usr/local/bin/puma -C /var/lib/gems/2.3.0/gems/puma-3.10.0/lib/puma.rb\n[Install]\nWantedBy=multi-user.target" >> /etc/systemd/system/puma.service

sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service

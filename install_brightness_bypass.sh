#!/bin/bash
#I wrote this version while mostly awake, so it should work right out of the box on linux mint.
sudo apt install inotify-tools -y

sudo cp brightness_bypass.service /etc/systemd/system/brightness_bypass.service

sudo chmod 644 /etc/systemd/system/brightness_bypass.service
sudo chwon root:root /etc/systemd/system/brightness_bypass.service

sudo cp brightness_bypass_service.sh /usr/local/bin/brightness_bypass_service.sh

sudo chown root:root /usr/local/bin/brightness_bypass_service.sh
sudo chmod 644 /usr/local/bin/brightness_bypass_service.sh

sudo systemctl daemon-reload
sudo systemctl enable brightness_bypass.service
sudo systemctl start brightness_bypass.service

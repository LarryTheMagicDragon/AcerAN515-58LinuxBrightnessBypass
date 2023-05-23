!#bin/bash
#looks like we're just gonna have to run it as root
apt install inotify-tools

touch /etc/systemd/system/brightness-hotfix.service

sudo chmod 744 /etc/systemd/system/brightness-hotfix.service

sudo cat "[Unit]
Description=File Monitoring Service
After=network.target

[Service]
ExecStart=/bin/bash /usr/local/bin/backlight-hotfix.sh
User=root

[Install]
WantedBy=default.target" > /etc/systemd/system/brightness-hotfix.service

sudo chmod 644 /etc/systemd/system/brightness-hotfix.service

sudo touch /usr/local/bin/backlight-hotfix.sh

sudo chmod 744 /usr/local/bin/backlight-hotfix.sh

sudo cat > '#!/bin/bash
while inotifywait -e modify /sys/class/backlight/nvidia_wmi_ec_backlight/brightness; do
    VALUE=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/brightness)
    NEWVALUE=$(($VALUE * 75))
    echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness
done'

sudo chmod 644 /usr/local/bin/backlight-hotfix.sh

sudo systemctl daemon-reload
sudo systemctl enable brightness-hotfix.service
sudo systemctl start file_monitor.service
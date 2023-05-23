!#bin/bash
apt install inotify-tools

touch /etc/systemd/system/brightness-hotfix.service

chmod 744 /etc/systemd/system/brightness-hotfix.service

echo '[Unit]\nDescription=File Monitoring Service\nAfter=network.target\n\n[Service]\nExecStart=/bin/bash /usr/local/bin/backlight-hotfix.sh\nUser=root\n\n[Install]\nWantedBy=default.target' > /etc/systemd/system/brightness-hotfix.service

touch /usr/local/bin/backlight-hotfix.sh

chmod 744 /usr/local/bin/backlight-hotfix.sh

cat > '#!/bin/bash\nwhile inotifywait -e modify /sys/class/backlight/nvidia_wmi_ec_backlight/brightness; do\n    VALUE=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/brightness)\n    NEWVALUE=$(($VALUE * 75))\n    echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness\ndone'

systemctl daemon-reload
systemctl enable brightness-hotfix.service
systemctl start brightness-hotfix.service
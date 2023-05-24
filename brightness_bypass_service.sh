#!/bin/bash
while inotifywait -e modify /sys/class/backlight/nvidia_wmi_ec_backlight/brightness; do
    VALUE=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/brightness)
    NEWVALUE=$(($VALUE * 75))
    echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness
done
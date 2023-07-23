#!/bin/bash
if [ -L sys/class/backlight/intel_backlight/brightness ]; then
    while inotifywait -e modify /sys/class/backlight/nvidia_wmi_ec_backlight/brightness; do
    VALUE=$(cat /sys/class/backlight/nvidia_wmi_ec_backlight/brightness)
    NEWVALUE=$(($VALUE * 75))
    echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness
    done
else
    while inotifywait -e modify /sys/class/backlight/acpi_video0/brightness; do
    cat /sys/class/backlight/acpi_video0/brightness > /sys/class/backlight/acpi_video1/brightness
    done
fi

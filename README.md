# AcerAN515-58LinuxBrightnessBypass

This will make the inbuilt brightness controls work. both the slider and the function keys.

download the files, and extract them. then run the commands

chmod 755 install_brightness_bypass.sh

./install_brightness_bypass.sh

it will ask you for your password, like any script that uses sudo. After you enter you password and the script runs, you'll be able to use the built in brightness controls in Linux mint, and the function keys.
if /sys/class/backlight/intel_backlight/brightness doesn't exsist on your system, you may need to add acpi_backlight=video to GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub so it looks something like GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=video".

after that you'll need to run "sudo update-grub"

# Additional notes
as of July 23rd 2023 this works on the latest version of linux mint.

I've traced the underlying issue with the brightness controls to a failure to load the acer-wmi kernel module. these are the error messages I found in my syslog when I run "sudo modprobe acer-wmi"

Jul 23 09:06:58 War-4 kernel: [44039.028774] acer_wmi: Acer Laptop ACPI-WMI Extras

Jul 23 09:06:58 War-4 kernel: [44039.028798] acer_wmi: Function bitmap for Communication Button: 0x801

Hypothetically this should work on any distro that can install inotifywait with apt, but I haven't tested. At some point I plan to make a version that is "apt agnostic" and can run on any distro

#!/usr/bin/bash

[ -w /sys/class/backlight/intel_backlight/brightness ] || gksudo chmod 777 /sys/class/backlight/intel_backlight/brightness
echo 50 > /sys/class/backlight/intel_backlight/brightness
echo ava | sudo -S  echo 4792 > /sys/class/backlight/intel_backlight/brightness

adf



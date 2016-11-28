#! /bin/bash

brightness=$(< /sys/class/backlight/intel_backlight/brightness)
echo $(expr $brightness + $1) > /sys/class/backlight/intel_backlight/brightness
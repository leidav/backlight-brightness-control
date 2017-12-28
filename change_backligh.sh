#!/bin/bash

max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
ac_brightness=$((max_brightness/2))
bat_brightness=$((max_brightness/10))
brightness=$ac_brightness


case $1 in
	"AC")
		echo $ac_brightness
		brightness=$ac_brightness
		;;
	"BAT")
		echo $bat_brightness
		brightness=$bat_brightness
		;;
esac
tee /sys/class/backlight/intel_backlight/brightness <<< "${brightness}"

#!/bin/bash

ac_brightness='50'
bat_brightness='10'
brightness=$ac_brightness

case $1 in
	"AC")
		brightness=$ac_brightness
		;;
	"BAT")
		brightness=$bat_brightness
		;;
esac

gdbus call --session --dest org.gnome.SettingsDaemon.Power \
	--object-path /org/gnome/SettingsDaemon/Power \
	--method org.freedesktop.DBus.Properties.Set \
	org.gnome.SettingsDaemon.Power.Screen Brightness "<${brightness}>"

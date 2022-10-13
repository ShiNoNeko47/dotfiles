#!/bin/sh
# lxsession &
lxpolkit &
numlockx &
picom --experimental-backends -b &
xset s off &
nm-applet &
udiskie -s &
blueman-applet &
autorandr -c &
system-config-printer-applet &
calcurse --daemon &
notify-send "$(calcurse -a)" &
firewall-applet &
# feh --bg-scale ${WALLPAPER}
# discord &
# protonvpn-applet &

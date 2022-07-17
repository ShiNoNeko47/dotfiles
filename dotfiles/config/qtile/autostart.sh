#!/bin/sh
# lxsession &
lxpolkit &
numlockx &
picom --experimental-backends -b &
xset s off &
nm-applet &
wal --backend colorthief -n -i Wallpapers/RenaRyuugu.png &
udiskie -s &
blueman-applet &
autorandr -c &
system-config-printer-applet &
calcurse --daemon
notify-send "$(calcurse -a)"
# feh --bg-scale ${WALLPAPER}
# discord &
# protonvpn-applet &

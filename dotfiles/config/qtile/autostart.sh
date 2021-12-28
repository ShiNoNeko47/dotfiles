#!/bin/sh
lxsession &
numlockx &
udiskie -s &
picom -b &
xset s off &
nm-applet &
wal --backend colorthief -n -i Wallpapers/RenaRyuugu.png &
calcurse --daemon &
# feh --bg-scale ${WALLPAPER}
# discord &
# protonvpn-applet &

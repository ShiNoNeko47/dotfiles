#!/bin/sh
lxsession &
numlockx &
picom --experimental-backends -b &
xset s off &
nm-applet &
wal --backend colorthief -n -i Wallpapers/RenaRyuugu.png &
udiskie -s &
blueman-applet &
rclone mount Zavrsni_rad:Nikola_Brezovec-zavrsni Documents/zavrsni_rad --log-file=Documents/rclonemount.txt --log-level INFO
# feh --bg-scale ${WALLPAPER}
# discord &
# protonvpn-applet &

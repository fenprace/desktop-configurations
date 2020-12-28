#!/bin/bash

MENU=`echo '  Lock | 鈴 Suspend |  Logout |  Reboot |  Shutdown |' | \
rofi -dpi 144 -no-lazy-grab -sep '|' -dmenu -i -p '' \
-columns 1 -lines 5 -width 10 \
-location 3 -xoffset -27 -yoffset 60
`
case "$MENU" in
  *Lock*) sh ~/.config/share/i3lock.sh ;;
  *Suspend*) systemctl suspend;;
  *Logout*) i3-msg exit;;
  *Reboot*) systemctl reboot ;;
  *Shutdown*) systemctl -i poweroff
esac

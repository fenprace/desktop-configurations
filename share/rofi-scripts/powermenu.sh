#! /bin/bash

MENU=`echo '  Lock |  Exit | 鈴 Suspend |  Hibernate |  Reboot |  Shutdown |' | \
rofi -dpi 144 -no-lazy-grab -sep '|' -dmenu -i -p '' \
-columns 1 -lines 6 -width 10 \
-location 3 -xoffset -27 -yoffset 60
`
case "$MENU" in
  *Lock*) sh ~/.config/share/i3lock.sh ;;
  *Exit*) i3-msg exit;;
  *Suspend*) systemctl suspend;;
  *Hibernate*) systemctl hibernate;;
  *Reboot*) systemctl reboot ;;
  *Shutdown*) systemctl -i poweroff
esac

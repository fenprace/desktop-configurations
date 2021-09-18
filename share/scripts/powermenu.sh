#! /bin/bash

MENU=$(echo -n '  Lock |  Exit | 鈴 Suspend |  Hibernate |  Reboot |  Shutdown ' | \
rofi -no-lazy-grab -sep '|' -dmenu -i -p '' \
-theme-str "window { width: 10%; } listview { columns: 1; lines: 6; }" \
-location 3 -xoffset -27 -yoffset 60
)
case "$MENU" in
  *Lock*) sh ~/.config/share/i3lock.sh ;;
  # *Exit*) i3-msg exit;;
  *Exit*) bspc quit;;
  *Suspend*) systemctl suspend;;
  *Hibernate*) systemctl hibernate;;
  *Reboot*) systemctl reboot ;;
  *Shutdown*) systemctl -i poweroff
esac

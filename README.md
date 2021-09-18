# Desktop Configurations

My Linux desktop environment configurations for i3, polybar, rofi and etc..

## Requirements

- i3-gaps
- i3lock-color
- polybar
- rofi
- networkmanager-dmenu
- feh
- picom
- amixer
- xbacklight

## Setup

```shell
git clone git@github.com:fenprace/desktop-configurations.git
cd desktop-configurations
./link.sh
i3-msg restart
polybar-msg cmd restart
```

## Colors

```
dark   = #1F1F1F, E0
dark fg = #FFFFFF
light  = #FFFFFF, C0
light fg = #454545
amber  = #FF8F00
blue   = #2196F3
cyan   = #006064
indigo = #3F51B5
```

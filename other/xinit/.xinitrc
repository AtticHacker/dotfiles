#!/bin/sh

if `lsusb | grep -q HHKB`; then
   echo "Don't use xmodmap"
else
    xmodmap ~/.Xmodmap
fi
unclutter -idle 3&
xsetroot -cursor_name left_ptr
xset r rate 300 35
xset -dpms; xset s off
xrandr --auto --output DVI-0 --mode 1920x1080 --left-of DVI-1
#xsetwacom set "Wacom BambooFun 6x8 stylus" Area 0 0 40600 13530
#xsetwacom set "Wacom BambooFun 6x8 eraser" Area 0 0 40600 13530
xcape -e "Control_L=Alt_L|G"
startxfce4

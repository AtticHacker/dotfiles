#!/bin/sh

xmodmap ~/.xmodmaprc
xsetroot -cursor_name left_ptr
feh --bg-scale ~/.bg.png
xrandr --output DVI-1 --auto --left-of DVI-0
xset r rate 300 35
exec ck-launch-session dbus-launch xmonad
#exec ck-launch-session gnome-session


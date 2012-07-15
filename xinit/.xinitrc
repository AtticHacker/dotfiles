#!/bin/sh

xmodmap ~/.xmodmaprc
xsetroot -cursor_name left_ptr
feh --bg-scale ~/.bg.png
xrandr --output DVI-1 --auto --left-of DVI-0
exec ck-launch-session dbus-launch xmonad
#XSexec ck-launch-session gnome-session


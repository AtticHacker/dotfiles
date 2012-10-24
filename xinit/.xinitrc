#!/bin/sh

xmodmap ~/.xmodmaprc
unclutter -idle 3&
xsetroot -cursor_name left_ptr
feh --bg-scale ~/.bakuman.jpg
xrandr --output DVI-1 --auto --left-of DVI-0
xset r rate 300 35
xset -dpms; xset s off
exec ck-launch-session dbus-launch xmonad
#exec ck-launch-session dbus-launch gnome-session

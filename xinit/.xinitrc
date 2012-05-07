#!/bin/sh

xsetroot -cursor_name left_ptr
feh --bg-scale ~/Images/System/background.jpg
xrandr --output DVI-1 --auto --left-of DVI-0
exec ck-launch-session dbus-launch xmonad


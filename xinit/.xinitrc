#!/bin/sh

xsetroot -cursor_name left_ptr
feh --bg-scale ~/Images/System/background.jpg
map="$HOME/.xmodmaprc"
xmodmap $map
exec ck-launch-session dbus-launch xmonad


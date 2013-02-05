#!/bin/sh

xrandr --auto --output DVI-0 --mode 1920x1080 --left-of DVI-1
#xrandr --output DVI-0 --mode 1920x1080
xmodmap ~/.xmodmaprc
unclutter -idle 3&
xsetroot -cursor_name left_ptr
#feh --bg-scale ~/.bg.jpg
xset r rate 300 35
xset -dpms; xset s off
xmonad

#startkde

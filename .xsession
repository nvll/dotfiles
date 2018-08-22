#!/bin/sh

# necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=gnome

# Disable audible bell
xset -b
xmodmap .Xmodmap
# set wallpaper if one exists

xrandr --output DVI-I-1 --right-of DP-3 --rotate left --auto
xrandr --output DP-3 --auto --primary
nitrogen --set-scaled .wallpaper || xsetroot -gray


# WM
exec i3

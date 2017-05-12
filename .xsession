#!/bin/sh

# necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=gnome

# Disable audible bell
xset -b

# set wallpaper if one exists
nitrogen --set-scaled .wallpaper || true

xmodmap .xmodmap

# network applet
nm-applet&

# volume!
volumeicon&

# WM
i3

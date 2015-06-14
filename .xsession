#!/bin/sh

# necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=gnome

# necessary for perforce
export P4CONFIG=.p4config
export P4DIFF="colordiff -u "
export P4MERGE=/google/src/files/head/depot/eng/perforce/mergep4.tcl
export P4EDITOR=$EDITOR

# Disable audible bell
xset -b

export GTK_IM_MODULE=xim

# Background color
xsetroot -solid "#333333"

# Start urxvtd
urxvtd -q -f -o
/home/tgeng/bin/kbd

exec i3

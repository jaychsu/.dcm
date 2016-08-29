#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
if [ -f $HOME/.Xmodmap ]; then
  /usr/bin/xmodmap $HOME/.Xmodmap
fi
exec awesome
# exec xterm

#!/bin/sh

# Solid background color
xsetroot -solid "#101010" &

# Disable system beep
xset -b &

# Configure DPMS (standby -> suspend -> off)
xset dpms 300 600 900 &

# Automatically lock screen
xautolock -time 10 -detectsleep -locker "~/.dotfiles/bin/i3exit.sh lock" &

# Initialize keyring
/usr/bin/gnome-keyring-daemon --replace --daemonize --components=secrets,ssh

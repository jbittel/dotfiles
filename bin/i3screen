#!/bin/sh

XRANDR="xrandr"

case "$1" in
    home)
        $XRANDR --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --primary --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --mode 1920x1080 --pos 1366x0 --rotate normal
        ;;
    work)
        $XRANDR --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --primary --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --mode 3440x1440 --pos 1366x0 --rotate normal
        ;;
    laptop)
        $XRANDR --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --primary --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
        ;;
    *)
        $XRANDR
        echo "Usage: $0 {home|work|laptop}"
        exit 2
esac

exit 0

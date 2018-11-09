#!/bin/sh

if amixer get Master | grep "off"; then
    amixer set Master unmute
    amixer set Headphone unmute
else
    amixer set Master mute
fi

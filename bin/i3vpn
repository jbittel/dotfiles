#!/bin/sh

CONNECTION_ID="UA"

case "$1" in
    on)
        nmcli connection up id $CONNECTION_ID
        ;;
    off)
        nmcli connection down id $CONNECTION_ID
        ;;
    *)
        echo "Usage: $0 {on|off}"
        exit 2
esac

exit 0

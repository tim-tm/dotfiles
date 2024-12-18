#!/bin/sh

set -xe

sel=$(printf "shutdown\nreboot\nlockscreen\n" | rofi -dmenu)
case $sel in
    shutdown)
        shutdown 0
    ;;
    reboot)
        reboot
    ;;
    lockscreen)
        slock
    ;;
    *)
    exit 1
    ;;
esac

#!/bin/sh

if type "xrandr"; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload tim &
    done
else
    polybar --reload tim &
fi

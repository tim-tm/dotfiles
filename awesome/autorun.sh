#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom
run nm-applet
exec ~/.config/polybar/launch.sh

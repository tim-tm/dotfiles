#!/bin/sh

set -xe

cd ~/.password-store
fl=$(find . -name \*.gpg -print | rofi -dmenu)
nm="${fl%.*}"

sel=$(printf "pw\notp\n" | rofi -dmenu)
case $sel in
    pw)
        pass -c ${nm}
    ;;
    otp)
        pass otp -c ${nm}
    ;;
    *)
    exit 1
    ;;
esac

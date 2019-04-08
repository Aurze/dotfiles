#!/bin/sh

wal -R
setxkbmap -layout us -variant altgr-intl
xrdb -merge ~/.Xresources
exec i3

#!/bin/bash
#ALSA
amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "muted" } else { printf sprintf($2)}}'

#PULSE
# by ilynx

#c=$(amixer get Master |grep % |awk 'FNR == 1 {print $6}')
#n="[on]"
#if [ "$c" == "$n" ]; then
#amixer -c 1 -M -D pulse get Master | grep % | awk 'FNR == 1 {print $5}' | grep -oP '[0-9]+'
#else
#echo 'muted'
#fi



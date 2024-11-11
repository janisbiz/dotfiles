#!/bin/bash
xrandr --output eDP --primary --mode 1920x1080 --pos 1594x1440 --rotate normal;
xrandr --output HDMI-A-0 --off;

dps=(`xrandr | grep --color=never '^DisplayPort-[0-9]' | sed -e 's/\(DisplayPort-[[:digit:]]*\).*/\1/'`);
for dp in ${dps[@]}
do
	xrandr --output $dp --off;
done

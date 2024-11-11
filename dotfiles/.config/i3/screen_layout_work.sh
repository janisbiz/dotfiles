#!/bin/bash
#set -o xtrace
connected_dps=(`xrandr | grep --color=never '^DisplayPort-[0-9]\sconnected' | sed -e 's/\(DisplayPort-[[:digit:]]*\).*/\1/'`)
for connected_dp in ${connected_dps[@]}
do
	xrandr --output $connected_dp --auto;
done

monitors=(`xrandr --listmonitors | grep --color=never '^[[:space:]][0-9]' | sed -e 's/\s[[:digit:]]:\s\+.*\s//'`);
xrandr \
	--output ${monitors[0]} --primary --mode 1920x1080 --pos 1601x1440 --rotate normal \
	--output ${monitors[1]} --mode 2560x1440 --pos 0x0 --rotate normal \
	--output ${monitors[2]} --mode 2560x1440 --pos 2560x0 --rotate normal

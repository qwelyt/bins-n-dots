#!/usr/bin/env bash
# 
# Tired of having my screen go black when watching something on the Internet.
# This is a simple scritp that moves the mouse 1 pixel, using xdotool, if it
# can detect that sound is playing via pulseaudio.
# It's not perfect, but it works.
#
# https://xkcd.com/196/
# Really which I wouldn't need this.
#
positive=true
while true; do
    RUNNING=$(pacmd list-sink-inputs | grep -w state | grep RUNNING)
    if [ -n "${RUNNING}" ]; then
        if [ "$positive" != "true" ]; then
            xdotool mousemove_relative -- -1 0
	    positive=true
        else
            xdotool mousemove_relative -- 1 0
	    positive=false
	fi
    fi
    sleep 299
done

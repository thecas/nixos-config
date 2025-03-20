#!/usr/bin/env bash
if (ps aux | grep mpv | grep -v grep > /dev/null) then
    pkill mpv
else
    runbg mpv https://www.mp3streams.nl/zender/npo-radio-1/stream/1-aac-64
    cava
fi

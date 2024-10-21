#!/usr/bin/env zsh
if [[ $1 =~ ^(speaker) ]]
then
    echo "switching to speakers"
    pactl set-default-sink 3186
elif [[ $1 =~ ^(in-ear) ]]
then
    echo "switching to soundbar"
    pactl set-default-sink 2787
elif [[ $1 =~ ^(over-ear) ]]
then
    echo "switching to over-ear"
    pactl set-default-sink 2530
else
    echo "useage: sound (speakers|soundbar|over-ear)"
fi

#!/usr/bin/env zsh
if [[ $1 =~ ^(speaker) ]]
then
    echo "switching to speakers"
    pactl set-default-sink 54
elif [[ $1 =~ ^(in-ear) ]]
then
    echo "switching to in-ear"
    pactl set-default-sink 209
elif [[ $1 =~ ^(over-ear) ]]
then
    echo "switching to over-ear"
    pactl set-default-sink 209
fi

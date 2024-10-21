#!/usr/bin/env zsh
if [[ $1 =~ ^(speaker) ]]
then
    echo "switching to speakers"
    TARGET_SINK_NAME="alsa_output.pci-0000_13_00.6.pro-output-0"
elif [[ $1 =~ ^(in-ear) ]]
then
    echo "switching to soundbar"
    TARGET_SINK_NAME="alsa_output.pci-0000_13_00.1.pro-output-7"

elif [[ $1 =~ ^(over-ear) ]]
then
    echo "switching to over-ear"
    TARGET_SINK_NAME="alsa_output.usb-Logitech_PRO_X_Wireless_Gaming_Headset-00.pro-output-0"
fi

# Find the index of the desired sink
TARGET_SINK_INDEX=$(pactl list short sinks | grep "$TARGET_SINK_NAME" | awk '{print $1}')

# Check if the sink was found
if [ -z "$TARGET_SINK_INDEX" ]; then
  echo "Sink not found: $TARGET_SINK_NAME"
  exit 1
fi

# Set the default sink
pactl set-default-sink "$TARGET_SINK_INDEX"

# Move all currently playing audio streams to the target sink
pactl list short sink-inputs | while read -r STREAM; do
  STREAM_ID=$(echo "$STREAM" | awk '{print $1}')
  pactl move-sink-input "$STREAM_ID" "$TARGET_SINK_INDEX"
done

echo "Default sink set to $TARGET_SINK_NAME and all streams moved."

#!/usr/bin/env zsh
if [[ $1 =~ ^(monitor) ]]
then
    echo "switching to monitor"
    TARGET_SINK_NAME="alsa_output.pci-0000_13_00.6.pro-output-0"
    TARGET_SOURCE_NAME="alsa_input.usb-046d_HD_Pro_Webcam_C920-02.pro-input-0"
    hyprctl keyword monitor HDMI-A-1, disable
elif [[ $1 =~ ^(tv) ]]
then
    echo "switching to tv"
    hyprctl keyword monitor HDMI-A-1,3840x2160@60,0x0,2
    hyprctl keyword monitor DP-1, disable
    TARGET_SINK_NAME="alsa_output.pci-0000_13_00.1.pro-output-7"
    TARGET_SOURCE_NAME="alsa_input.usb-046d_HD_Pro_Webcam_C920-02.pro-input-0"

elif [[ $1 =~ ^(both) ]]
then
    echo "switching to both"
    hyprctl keyword monitor HDMI-A-1,3840x2160@60,0x0,2
    hyprctl keyword monitor DP-1,3440x1440@60,3840x0,1
    TARGET_SINK_NAME="alsa_output.pci-0000_13_00.1.pro-output-7"
    TARGET_SOURCE_NAME="alsa_input.usb-046d_HD_Pro_Webcam_C920-02.pro-input-0"
fi

# Find the index of the desired sink
TARGET_SINK_INDEX=$(pactl list short sinks | grep "$TARGET_SINK_NAME" | awk '{print $1}')

# Find the index of the desired source
TARGET_SOURCE_INDEX=$(pactl list short sources | grep "$TARGET_SOURCE_NAME" | awk '{print $1}')

# Check if the sink was found
if [ -z "$TARGET_SINK_INDEX" ]; then
  echo "Sink not found: $TARGET_SINK_NAME"
  exit 1
fi

# Check if the source was found
if [ -z "$TARGET_SOURCE_INDEX" ]; then
  echo "Source not found: $TARGET_SOURCE_NAME"
  exit 1
fi

# Set the default sink (output)
pactl set-default-sink "$TARGET_SINK_INDEX"

# Set the default source (input/microphone)
pactl set-default-source "$TARGET_SOURCE_INDEX"

# Move all currently playing audio streams to the target sink
pactl list short sink-inputs | while read -r STREAM; do
  STREAM_ID=$(echo "$STREAM" | awk '{print $1}')
  pactl move-sink-input "$STREAM_ID" "$TARGET_SINK_INDEX"
done

# Move all currently recording streams to the target source
pactl list short source-outputs | while read -r STREAM; do
  STREAM_ID=$(echo "$STREAM" | awk '{print $1}')
  pactl move-source-output "$STREAM_ID" "$TARGET_SOURCE_INDEX"
done

echo "Default sink set to $TARGET_SINK_NAME and all streams moved."
echo "Default source set to $TARGET_SOURCE_NAME and all streams moved."

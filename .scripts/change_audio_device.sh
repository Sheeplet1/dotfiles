#!/bin/bash

# Get the current default sink
current_sink=$(pactl get-default-sink)

# Define the sinks
g560_sink="alsa_output.usb-Logitech_G560_Gaming_Speaker_00000000-00.analog-stereo"
analog_sink="alsa_output.pci-0000_09_00.4.analog-stereo"

# Toggle the sink
if [ "$current_sink" == "$g560_sink" ]; then
	pactl set-default-sink "$analog_sink"
	pactl move-sink-input "$(pactl list short sink-inputs | grep RUNNING | cut -f1)" "$analog_sink"
else
	pactl set-default-sink "$g560_sink"
	pactl move-sink-input "$(pactl list short sink-inputs | grep RUNNING | cut -f1)" "$g560_sink"
fi

#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
# This example assumes your bar is named 'example' in config.ini
# If you named it differently (e.g., 'main'), change 'example' below.
polybar example &


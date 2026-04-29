#!/bin/bash

if ! pgrep -x "drift" > /dev/null; then
    alacritty --config-file ~/.config/hypr/configs/alacritty_screensaver.toml -e drift
fi

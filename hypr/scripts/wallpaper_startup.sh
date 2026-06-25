#!/bin/bash

# Wait until startup
sleep 2

# Wallpaper-Ordner
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Zufälliges Wallpaper auswählen
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Setzen
FirstMonitor="$( sudo cat ../settings.json | jq -r '.firstMonitor' )"
SecondMonitor="$( sudo cat ../settings.json | jq -r '.secondMonitor' )"
WallpaperScriptEnabled="$( sudo cat ../settings.json | jq -r '.wallpaperScriptEnabled' )"

if [[ "$WallpaperScriptEnabled" ]]; then
    if [[ "$FirstMonitor" != null  ]]; then
        hyprctl hyprpaper wallpaper "$FirstMonitor,$WALLPAPER,fill"
    fi

    if [[ "$SecondMonitor" != null  ]]; then
        hyprctl hyprpaper wallpaper "$SecondMonitor,$WALLPAPER,fill"
    fi
fi

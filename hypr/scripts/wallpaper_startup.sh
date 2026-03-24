#!/bin/bash

# Wait until startup
sleep 2

# Wallpaper-Ordner
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Zufälliges Wallpaper auswählen
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Setzen
hyprctl hyprpaper wallpaper "DP-1,$WALLPAPER,fill"

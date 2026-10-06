#!/bin/bash
set -e

# selected_window=$(tmux list-windows -F "#{window_index}: #{window_name}" | fzf --delimiter=":" --prompt="window> " || true)
selected_window=$(tmux list-windows -F "#{window_index}: #{window_name}" | fzf --prompt="window> " || true)

if [ "$selected_window" = "" ]; then
    exit 0
fi

tmux select-window -t ":${selected_window%%:*}"

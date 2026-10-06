#!/bin/bash
set -e

selected_session=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="switch session> " || true)

if [ "$selected_session" = "" ]; then
    exit 0
fi

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$selected_session"
else
    tmux attach-session -t "$selected_session"
fi

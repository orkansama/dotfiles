#!/bin/bash
set -e

misc_session_name="misc"
SESSION_HAS_MISC=$(tmux list-sessions | grep $misc_session_name || true)
if [ "$SESSION_HAS_MISC" = "" ]
then
    tmux new-session -d -s $misc_session_name
fi

selected_directory=$(cd "$HOME/projects/" && ls -d */ | fzf)
full_path_of_selected_directory="$HOME/projects/${selected_directory}"
new_session_name=$selected_directory

SESSION_EXISTS=$(tmux list-sessions | grep $new_session_name || true)
if [ "$SESSION_EXISTS" = "" ]; then
    cd $full_path_of_selected_directory

    tmux new-session -d -s $new_session_name 

    # create lazygit
    lazygit_window_name="lazygit"
    tmux new-window -t $new_session_name -n $lazygit_window_name
    tmux send-keys -t "$new_session_name:$lazygit_window_name" "lazygit" C-m

    # create claude window
    claude_window_name="claude"
    tmux new-window -t $new_session_name -n $claude_window_name
    tmux send-keys -t "$new_session_name:$claude_window_name" 'claude' C-m

    # create yazi window
    yazi_window_name="yazi"
    tmux new-window -t $new_session_name -n $yazi_window_name
    tmux send-keys -t "$new_session_name:$yazi_window_name" 'yazi' C-m
fi

tmux switch-client -t $new_session_name:0

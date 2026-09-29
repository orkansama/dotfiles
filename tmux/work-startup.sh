#!/bin/bash

# Session Name
user=$(whoami)
selected_directory=$(cd "/home/$user/projects/" && ls -d */ | fzf)
path_to_use="/home/$user/projects/${selected_directory}"

SESSIONEXISTS=$(tmux list-sessions | grep $selected_directory)
if [ "$SESSIONEXISTS" != "" ]
    then
        tmux attach-session -t $selected_directory:1
    else
        new_session_name=$selected_directory
        cd $path_to_use || exit 1

        # Start New Session with our name
        tmux new-session -d -s $new_session_name

        # create lazygit
        lazygit_window_name="lazygit"
        tmux new-window -t $new_session_name -n $lazygit_window_name
        tmux send-keys -t $lazygit_window_name "lazygit" C-m

        # create claude window
        claude_window_name="claude"
        tmux new-window -t $new_session_name -n $claude_window_name
        tmux send-keys -t $claude_window_name 'claude' C-m

        # create yazi window
        yazi_window_name="yazi"
        tmux new-window -t $new_session_name -n $yazi_window_name
        tmux send-keys -t $yazi_window_name 'yazi' C-m

        tmux kill-window -t $new_session_name:1
fi

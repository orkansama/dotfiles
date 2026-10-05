#!/bin/bash

# Session Name
user=$(whoami)
selected_directory=$(cd "/home/$user/projects/" && ls -d */ | fzf)
path_to_use="/home/$user/projects/${selected_directory}"

SESSION_EXISTS=$(tmux list-sessions | grep $selected_directory)
if [ "$SESSION_EXISTS" != "" ]
    then
        exit 1
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
fi

misc_session_name="misc"
SESSION_HAS_MISC=$(tmux list-sessions | grep $misc_session_name)
if [ "$SESSION_HAS_MISC" = "" ]
then
    # Create misc session
    tmux new-session -d -s $misc_session_name
fi

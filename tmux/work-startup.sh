#!/bin/bash

# Session Name
session="work"

SESSIONEXISTS=$(tmux list-sessions | grep $session)
if [ "$SESSIONEXISTS" = "" ]
then
    user=$(whoami)
    select=$(cd "/home/$user/projects/" && ls -d */ | fzf)
    path_to_use="/home/$user/projects/${select}"

    cd $path_to_use || exit 1

    # Start New Session with our name
    tmux new-session -d -s $session

    # create normal terminal
    terminal_window_name="terminal"
    tmux new-window -t $session:0
    tmux rename-window -t $session:0 $terminal_window_name

    # create lazygit
    lazygit_window_name="lazygit"
    tmux new-window -t $session:1 -n $lazygit_window_name
    tmux send-keys -t $lazygit_window_name "lazygit" C-m

    # create claude window
    claude_window_name="claude"
    tmux new-window -t $session:2 -n $claude_window_name
    tmux send-keys -t $claude_window_name 'claude' C-m

    # create yazi window
    yazi_window_name="yazi"
    tmux new-window -t $session:3 -n $yazi_window_name
    tmux send-keys -t $yazi_window_name 'yazi' C-m
fi

tmux attach-session -t $session:0

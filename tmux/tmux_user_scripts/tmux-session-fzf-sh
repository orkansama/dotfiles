#!/bin/bash

selected_session=$(tmux ls -F\#S | fzf)

tmux attach -t $selected_session

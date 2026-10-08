#!/bin/bash
if [ -z "$PS1" ] ; then
    echo "This script must be sourced. Use \"source <script>\" instead."
    exit
fi

user_select_key_with_fzf() {
    user_selection=$(
        ls -p ~/.ssh/id_* |
        grep -v '\.pub' |
        fzf --multi \
            --bind 'ctrl-a:toggle-all' \
            --prompt "[Select SSH-Key (2x^a for all)]> " \
            --border "rounded" \
            --height=60%) || return

        while IFS= read -r line; do
            ssh-add $line < /dev/tty
        done <<< "$user_selection"

    echo "Done!"
}

killall -w ssh-agent
rm ~/.ssh/agent.sock 2> /dev/null
eval `ssh-agent -s -a ~/.ssh/agent.sock`
user_select_key_with_fzf

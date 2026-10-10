#!/bin/bash
set -e

user_select_with_fzf() {
    if [[ $user_type_selection == "D" ]]; then
        user_ln_selection=$(ls -d */ | fzf --bind 'ctrl-a:toggle-all' --multi --prompt "[TAB for multi-selection]> " --border "rounded" --height=60%)

    elif [[ $user_type_selection == "F" ]]; then
        user_ln_selection=$(ls -pa | grep -v / | fzf --bind 'ctrl-a:toggle-all' --multi --prompt "[TAB for multi-selection]> " --border "rounded" --height=60%)

    else
        echo "invalid option. aborting ..."
        exit 1
    fi

    while IFS= read -r line; do
        selection_with_full_path="$(pwd)/$line"
        ln --symbolic $selection_with_full_path $path_to_use
    done <<< "$user_ln_selection"

    echo "Done!"
}

read -p "[F]ile/[D]irectory?: " user_type_selection
if [[ "$user_type_selection" != "F" && "$user_type_selection" != "D" ]]; then
    echo "invalid option. aborting ..."
    exit 1
fi

read -p "Select Path [M]anuall(full path)/[C]onfig/[H]ome: " user_path_selection

if [[ $user_path_selection == "M" ]]; then
    read -r manuall_selection
    path_to_use=$manuall_selection
    user_select_with_fzf

elif [[ $user_path_selection == "C" ]]; then
    path_to_use=$HOME/.config
    user_select_with_fzf

elif [[ $user_path_selection == "H" ]]; then
    path_to_use=$HOME
    user_select_with_fzf

else
    echo "invalid option. aborting ..."
    exit 1
fi

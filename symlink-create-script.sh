#!/bin/bash

user_select_with_fzf() {
    user_ln_selection=$(ls -d */ | fzf --multi --prompt "[TAB for multi-selection]> " --border "rounded" --height=60%)

    while IFS= read -r line; do
        selection_with_full_path="$(pwd)/$line"
        ln --symbolic $selection_with_full_path $path_to_use
    done <<< "$user_ln_selection"

    echo "Done!"
}

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
fi

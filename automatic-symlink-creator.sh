#!/bin/bash
set -e

dirs=(
    alacritty
    hypr
    lazygit
    rofi
    tmux
    waybar
    yazi
    zsh
)

for dir in "${dirs[@]}"; do
    ln -sfn "$(pwd)/$dir" "$HOME/.config/"
done
echo "done linking dirs"

ln -sf "$(pwd)/.gitconfig" "$HOME/"
echo "done linking .gitconfig"

ln -sf "$(pwd)/zsh/.zshenv" "$HOME/"
echo "done linking .zshenv"

ln -sf "$(pwd)/ssh-agent-start.sh" "$HOME/"
echo "done linking ssh-agent-start.sh"

HISTFILE="$ZDOTDIR/.zhistory" HISTSIZE=10000
SAVEHIST=10000

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

if [ -n "$TMUX" ]; then
    nvim() {
        sessionname="$(tmux display-message -p '#S')"

        local socket="/tmp/neovim_${sessionname}"

        if [ ! -e "$socket" ]; then
            command nvim --listen "$socket" "$@"
        else
            command nvim "$@"
        fi
    }
fi

# OH MY ZSH
export EDITOR="nvim"
export ZSH="$ZDOTDIR/ohmyzsh/"
ZSH_THEME="agnoster"

plugins=(zoxide archlinux)

source "$ZSH/oh-my-zsh.sh"

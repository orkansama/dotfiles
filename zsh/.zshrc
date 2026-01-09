HISTFILE="$ZDOTDIR/.zhistory" HISTSIZE=10000
SAVEHIST=10000

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# OH MY ZSH
export ZSH="$ZDOTDIR/ohmyzsh/"
ZSH_THEME="agnoster"

plugins=(zoxide archlinux)

source "$ZSH/oh-my-zsh.sh"

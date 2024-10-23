export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LANG=ja_JP.UTF-8
export CLICOLOR=1
export TERM=xterm-256color

# Support XDG base directory specification
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Prevent duplicate paths
typeset -U path PATH

[ ! -d ${HOME}/.local/share/tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

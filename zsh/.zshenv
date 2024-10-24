export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LANG=ja_JP.UTF-8
export CLICOLOR=1
export TERM=xterm-256color

# Support XDG base directory specification
# Run for bootstrap: echo "export ZDOTDIR=$HOME/.config/zsh" | sudo tee -a /etc/zshenv
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ASDF_DIR="$XDG_CONFIG_HOME"/asdf
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME"/asdf/asdfrc
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Prevent duplicate paths
typeset -U path PATH

# Install asdf
[ ! -d $XDG_CONFIG_HOME/asdf ] && git clone https://github.com/asdf-vm/asdf.git $XDG_CONFIG_HOME/asdf

# Install tpm
[ ! -d $XDG_DATA_HOME/tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm $XDG_DATA_HOME/tmux/plugins/tpm

# Setup anyenv
[ -d ${HOME}/.anyenv ] && export PATH="$PATH:$HOME/.anyenv/bin"

# Prevent duplicate paths
typeset -U path PATH

[ ! -d ${HOME}/.local/share/tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

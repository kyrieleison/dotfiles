# Setup anyenv
[ -d ${HOME}/.anyenv ] && export PATH="$PATH:$HOME/.anyenv/bin"

# Prevent duplicate paths
typeset -U path PATH

# Source prezto
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Setup anyenv
[ -d ${HOME}/.anyenv ] && export PATH="$PATH:$HOME/.anyenv/bin"

# Setup ssh forward agent in tmux
# agent="$HOME/tmp/.ssh-agent-`whoami`"
# if [ -S "$agent" ]; then
#   export SSH_AUTH_SOCK=$agent
# elif [ ! -S "$SSH_AUTH_SOCK" ]; then
#   export SSH_AUTH_SOCK=$agent
# elif [ ! -L "$SSH_AUTH_SOCK" ]; then
#   ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
# fi

# Prevent duplicate paths
typeset -U path PATH

echo 'Loaded ~/.zshenv'

# Source prezto
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Setup anyenv
[ -d ${HOME}/.anyenv ] && export PATH="$PATH:$HOME/.anyenv/bin"

# Setup rust
[ -d ${HOME}/.cargo/env ] && source $HOME/.cargo/env

# Setup go
$(where go > /dev/null) && export GOPATH=$HOME/.go

# Setup pandoc
[ -d ${HOME}/.cabel ] && export PATH="$PATH:$HOME/.cabal/bin"

# Setup postgre
[ -d /usr/local/var/postgres ] && export PGDATA=/usr/local/var/postgres

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

#!/bin/zsh

set -eux

if [ ! -d $HOME/dotfiles ]; then
  git clone git@github.com:kyrieleison/dotfiles.git $HOME/dotfiles
fi

source $HOME/dotfiles/etc/init/homebrew.sh
source $HOME/dotfiles/etc/init/prezto.sh
source $HOME/dotfiles/etc/init/neobundle.sh
source $HOME/dotfiles/etc/init/defaults.sh

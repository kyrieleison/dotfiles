#!/bin/zsh

# see: https://brew.sh/index_ja
if [ ! -f /usr/local/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle
brew bundle cleanup

#!/bin/zsh

set -eux

brew upgrade
brew bundle dump --force
brew bundle cleanup

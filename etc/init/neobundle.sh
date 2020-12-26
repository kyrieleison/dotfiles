#!/bin/zsh

# see: https://github.com/Shougo/neobundle.vim
if [ ! -d $HOME/.vim/bundle ]; then
  mkdir -p $HOME/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi

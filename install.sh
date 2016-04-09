#!/bin/bash

DOTFILES_DIR=$(dirname $(readlink -f "$0"))

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ ! -d "$ZSH" ]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

ln -f -s $DOTFILES_DIR/zshrc ~/.zshrc
ln -f -s $DOTFILES_DIR/psqlrc ~/.psqlrc

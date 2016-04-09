#!/bin/bash

DOTFILES_DIR=$(dirname $(readlink -f "$0"))

if [[ ! -n "$ZSH" ]]; then
  ZSH=$HOME/.oh-my-zsh
fi

if [[ ! -d "$ZSH" ]]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

ln -f -s $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -f -s $DOTFILES_DIR/psqlrc $HOME/.psqlrc


#### VIM
VAM=$HOME/.vim/addons/vim-addon-manager

if [[ ! -d "$VAM" ]]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/MarcWeber/vim-addon-manager.git $VAM
fi

ln -f -s $DOTFILES_DIR/vimrc ~/.vimrc

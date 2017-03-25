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

# powerline fonts
FONTS_DIR=$HOME/.fonts/
FONTCONFIG_DIR=$HOME/.config/fontconfig/conf.d

curl -s -L -C - -o $FONTS_DIR/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
curl -s -L -C - -o $FONTCONFIG_DIR/10-powerline-symbols.conf https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

fc-cache -vf $FONTS_DIR

pacman -S ripgrep

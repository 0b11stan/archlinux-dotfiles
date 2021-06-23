#!/bin/bash

mkdir ~/AUR ~/.config &>/dev/null

zshplugins="zsh-autosuggestions zsh-theme-powerlevel10k"

requirements="git neovim python python-pynvim zsh base-devel fzf clang
              rsync autopep8 ttf-hack stow alacritty"

sudo pacman -S --needed --noconfirm $requirements $zshplugins \
  && ./syncaur.sh \
  && git config --global user.email "tristan@tic.sh" \
  && git config --global user.name "Tristan Pinaudeau"
  #&& nvim --headless +PlugInstall +qa \
  
sudo chsh -s /usr/bin/zsh $USER

stow -t /home/tristan/ dotfiles

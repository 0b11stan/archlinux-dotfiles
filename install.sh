#!/bin/bash

mkdir ~/AUR ~/.config &>/dev/null

requirements="git neovim python python-pynvim zsh base-devel fzf clang
              ttf-droid zsh-theme-powerlevel10k rsync"

sudo pacman -S --noconfirm $requirements \
  && ./syncaur.sh \
  && git config --global user.email "tristan@tic.sh" \
  && git config --global user.name "Tristan Pinaudeau"
  #&& nvim --headless +PlugInstall +qa \
  
for app in $(ls config); do
  ln -s ~/repos/perso/dotfiles/config/$app ~/.config/$app &>/dev/null
done
ln -s ~/repos/perso/dotfiles/p10k.zsh ~/.p10k.zsh &>/dev/null
ln -s ~/repos/perso/dotfiles/zshrc ~/.zshrc &>/dev/null

sudo chsh -s /usr/bin/zsh $USER

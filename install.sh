#!/bin/bash

mkdir ~/AUR ~/.config &>/dev/null

sudo pacman -S --noconfirm git neovim python python-pynvim zsh base-devel fzf \
                           clang \
  && ./sync_aur_packages.sh \
  && nvim --headless +PlugInstall +qa
  
for app in $(ls config); do
  ln -s ~/repos/perso/dotfiles/config/$app ~/.config/$app &>/dev/null
done
ln -s ~/repos/perso/dotfiles/p10k.zsh ~/.p10k.zsh &>/dev/null
ln -s ~/repos/perso/dotfiles/zshrc ~/.zshrc &>/dev/null

sudo chsh -s /usr/bin/zsh $USER

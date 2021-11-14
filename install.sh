#!/bin/bash

source dotfiles/.vars.sh || {
  echo "File dotfiles/vars.sh not found" && exit 1;
}

mkdir ~/AUR ~/.config &>/dev/null

zshplugins="zsh-autosuggestions zsh-theme-powerlevel10k"

requirements="git neovim python python-pynvim zsh base-devel fzf clang
              rsync autopep8 stow alacritty bat"

test $SELF_IS_GRAPHIC -eq 1 && \
  graphics="sway ttf-hack nodejs bemenu waybar qt5-wayland qutebrowser"

sudo pacman -S --needed --noconfirm $requirements $zshplugins $graphics \
  && ./syncaur.sh \
  && git config --global user.email $SELF_EMAIL \
  && git config --global user.name "Tristan Pinaudeau"
  
sudo chsh -s /usr/bin/zsh $USER

stow -t /home/tristan/ dotfiles

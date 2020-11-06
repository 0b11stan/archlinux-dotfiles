#!/bin/bash

mkdir ~/AUR ~/.config &>/dev/null

zshplugins="zsh-autosuggestions zsh-theme-powerlevel10k"

requirements="git neovim python python-pynvim zsh base-devel fzf clang
              ttf-droid rsync autopep8"

sudo pacman -S --needed --noconfirm $requirements $zshplugins \
  && ./syncaur.sh \
  && git config --global user.email "tristan@tic.sh" \
  && git config --global user.name "Tristan Pinaudeau"
  #&& nvim --headless +PlugInstall +qa \
  
link() { test -L $2 || ln -s $1 $2; }

for app in $(ls config); do
  link ~/repos/perso/dotfiles/config/$app ~/.config/$app
done
link ~/repos/perso/dotfiles/p10k.zsh ~/.p10k.zsh
link ~/repos/perso/dotfiles/zshrc ~/.zshrc
link ~/repos/perso/dotfiles/qute_userscripts ~/.local/share/qutebrowser/userscripts

sudo chsh -s /usr/bin/zsh $USER

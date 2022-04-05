#!/bin/bash

entry() {
  if [[ "$1" == "-h" || $# -ne 1 ]]; then
    echo "Usage: $0 <cli|gui>"
    exit
  fi
  
  mkdir ~/AUR ~/sources ~/.config &>/dev/null

  sudo pacman -Syu --noconfirm
  if [[ "$1" == "gui" ]]; then 
    install_target '*'
  else
    install_target cli
  fi
  sudo chsh -s /usr/bin/zsh tristan

  git config --global user.email tristan@tic.sh
  git config --global user.name "Tristan Auvinet"

  stow -t /home/tristan/ dotfiles
}

install_target() {
  pac_clean "$1"
  pac_install "$1"

  aur_clean "$1"
  aur_install "$1"

  go_clean "$1"
  go_install "$1"

  for src in $(cat src-$1.txt | cut -d '/' -f 1,2); do src_install $src; done
}

install_aur_package() {
  git clone https://aur.archlinux.org/$1.git ~/AUR/$1 &>/dev/null && {
    pushd ~/AUR/$1 \
      && echo installing $1... \
      && makepkg -si --noconfirm \
    popd 
  } || echo $1 already installed
}

pac_install() {
  sudo pacman --noconfirm -S --needed - < <(cat pkg-pac-$1.txt)
}

pac_clean() {
  sudo pacman --noconfirm -Rsu $(comm -23 <(pacman -Qq | sort) <(sort pkg-pac-$1.txt))
}

aur_install() {
  missing=$(sort -u <(ls --color=never ~/AUR/) <(cat pkg-aur-$1.txt))
  for package in $missing; do install_aur_package $package; done
}

aur_clean() {
  for package in $(ls ~/AUR | grep -vf pkg-aur-$1.txt); do
    echo removing $1 ...
    sudo pacman -Rns $package
    rm -vrf ~/AUR/$package
  done
}

go_install() {
  for id in $(cat ./pkg-go-$1.txt); do
    go install github.com/$id@latest
  done
}

go_clean() {
  echo 'go_clean: Not Implemented yet...'
}

src_install() {
  git clone https://github.com/$1.git ~/sources/$1 2>/dev/null || {
    echo $1 already installed
  }
}

entry $@

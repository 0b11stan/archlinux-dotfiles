#!/bin/bash

install_aur_package() {
  git clone https://aur.archlinux.org/$1.git ~/AUR/$1 &>/dev/null && {
    echo installing $1... \
      && pushd ~/AUR/$1 \
      && makepkg -si --noconfirm
    popd 
  } || echo $1 already installed
}

# remove unused packages
for package in $(ls ~/AUR | grep -vf aurpackages); do
  rm -vrf ~/AUR/$package;
  pacman -Rns $package
done

# install only uninstalled packages
uninstalled=$(sort <(ls --color=never ~/AUR/) aurpackages | uniq -u)
for package in $uninstalled; do install_aur_package $package; done

#!/bin/bash

sudo pacman -Syu

for path in $(ls -d ~/AUR/*); do
    pushd $path
    git pull
    makepkg -si
    popd
done

for plugin in $(cat ./zsh_plugins ); do
    cd ~/sources/public/$(echo "$plugin" | cut -d '/' -f2)
    git pull
done

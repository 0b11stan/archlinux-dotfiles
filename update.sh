#!/bin/bash

sudo pacman -Syu

for path in $(ls -d ~/AUR/*); do
    pushd $path
    git pull
    makepkg -si
    popd
done

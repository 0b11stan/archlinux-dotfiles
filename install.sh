function install_aur_package() {
  git clone https://aur.archlinux.org/$1.git ~/AUR/$1 &>/dev/null && {
    echo installing $1... \
      && pushd ~/AUR/$1 \
      && makepkg -si --noconfirm
    popd 
  } || echo $1 already installed
}

mkdir ~/AUR &>/dev/null

sudo pacman -S --noconfirm git neovim python python-pynvim zsh base-devel fzf \
                           clang \
  && install_aur_package zsh-theme-powerlevel10k-git \
  && install_aur_package neovim-plug \
  && nvim --headless +PlugInstall +qa
  
ln -s ~/repos/perso/dotfiles/config ~/.config &>/dev/null
ln -s ~/repos/perso/dotfiles/p10k.zsh ~/.p10k.zsh &>/dev/null
ln -s ~/repos/perso/dotfiles/zshrc ~/.zshrc &>/dev/null

sudo chsh -s /usr/bin/zsh $USER

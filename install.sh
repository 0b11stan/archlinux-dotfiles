function install_aur_package() {
  git clone https://aur.archlinux.org/$1.git ~/AUR/$1 &>/dev/null && {
    echo installing $1... \
      && pushd ~/AUR/$1 \
      && makepkg -si --noconfirm
    popd 
  } || echo $1 already installed
}


mkdir ~/AUR ~/.config &>/dev/null

sudo pacman -S --noconfirm git neovim python python-pynvim zsh base-devel fzf \
                           clang \
  && install_aur_package neovim-plug \
  && install_aur_package zsh-theme-powerlevel10k-git \
  && install_aur_package zsh-fast-syntax-highlighting \
  && nvim --headless +PlugInstall +qa
  
for app in $(ls config); do
  ln -s ~/repos/perso/dotfiles/config/$app ~/.config/$app &>/dev/null
done
ln -s ~/repos/perso/dotfiles/p10k.zsh ~/.p10k.zsh &>/dev/null
ln -s ~/repos/perso/dotfiles/zshrc ~/.zshrc &>/dev/null

sudo chsh -s /usr/bin/zsh $USER

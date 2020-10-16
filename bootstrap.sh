if [[ $(id -u) -eq 0 ]]
then pacman -Syu \
    && pacman -S --noconfirm sudo git openssh \
    && useradd -m tristan \
    && echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan \
    && passwd tristan
else mkdir -p ~/repos/perso/ \
    && git clone https://github.com/0b11stan/dotfiles.git ~/repos/perso/dotfiles \
    && pushd ~/repos/perso/dotfiles \
    && ./install.sh \
    && git remote remove origin \
    && git remote add origin git@github.com:0b11stan/dotfiles.git \
    && ssh-keygen \
    && echo "\nADD THE KEY IN GIT SERVERS :\n$(cat ~/.ssh/id_rsa.pub)\n"
fi

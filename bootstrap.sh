if [[ $(id -u) -eq 0 ]]
then pacman -Syu --noconfirm \
    && pacman -S --noconfirm sudo git openssh \
    && useradd -m tristan \
    && echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan \
    && passwd tristan \
    && sudo -u tristan bash -i -c "$(curl 172.17.0.1:8000/bootstrap.sh)" \
    && su tristan
else mkdir -p ~/repos/perso/ \
    && git clone https://github.com/0b11stan/dotfiles.git ~/repos/perso/dotfiles \
    && pushd ~/repos/perso/dotfiles \
    && ./install.sh \
    && git remote remove origin \
    && git remote add origin git@github.com:0b11stan/dotfiles.git \
    && ssh-keygen -f ~/.ssh/id_rsa \
    && echo 'ADD SSH KEY IN GIT SERVERS :' \
    && cat ~/.ssh/id_rsa.pub
fi

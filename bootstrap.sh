#if [[ $(id -u) -eq 0 ]]
#then pacman -Syu --noconfirm \
#    && pacman -S --noconfirm sudo git openssh \
#    && useradd -m tristan \
#    && echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan \
#    && passwd tristan \
#    && sudo -u tristan bash -i -c "$(curl https://sta.tic.sh/bootstrap)" \
#    && su tristan
#else mkdir -p ~/sources/public/ \
#    && git clone https://github.com/0b11stan/dotfiles.git ~/repos/perso/dotfiles \
#    && pushd ~/sources/public/dotfiles \
#    && ./install.sh \
#    && git remote remove origin \
#    && git remote add origin git@github.com:0b11stan/dotfiles.git \
#    && ssh-keygen -f ~/.ssh/id_rsa \
#    && echo 'ADD SSH KEY IN GIT SERVERS :' \
#    && cat ~/.ssh/id_rsa.pub
#fi

useradd -m tristan
echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan
passwd tristan

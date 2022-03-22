FROM docker.io/archlinux

RUN pacman --noconfirm -Syu git sudo
RUN useradd -m tristan \
 && echo 'tristan ALL=(ALL) NOPASSWD:ALL' \
  | tee /etc/sudoers.d/10-tristan

WORKDIR /home/tristan
USER tristan

RUN mkdir -p /home/tristan/sources/0b11stan

CMD bash

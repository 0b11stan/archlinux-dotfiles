# dotfiles

| Component         | Sources                                                   |
|-------------------|----------------------------------------------------------:|
| Window manager    | [sway](https://github.com/swaywm/sway)                    |
| Status bar        | [waybar](https://github.com/Alexays/Waybar)               |
| Launcher          | [bemenu](https://github.com/Cloudef/bemenu)               |
| Terminal Emulator | [termite](https://github.com/thestinger/termite)          |
| Editor            | [neovim](https://github.com/neovim/neovim)                |
| Browser           | [qutebrowser](https://github.com/qutebrowser/qutebrowser) |
| Password Manager  | [pass](https://www.passwordstore.org/#download)           |

Before playing any scripts:
```bash
pacman -S --noconfirm sudo \
  && useradd -m tristan \
  && echo 'tristan ALL=(ALL) ALL' > /etc/sudoers.d/10-tristan \
  && passwd tristan
```

TODO :
* Automate nvim => `:PugInstall`

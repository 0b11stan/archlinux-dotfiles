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

## Usage

```bash
  docker run -it archlinux bash -ic "$(curl https://sta.tic.sh/bootstrap.sh)"
```

Should be prompted 5 times :
* 2 for tristan's new password
* 1 for using sudo as tristan
* 2 for generating a new ssh key for this new host

## TODO :

* Add a bootstrap script only for terminal sessions without the arch specifics

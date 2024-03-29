dotfiles
========

**DEPRECATED : [I switched to nixos](https://github.com/0b11stan/nixconfig)**

---

![Screenshot](/rice.png)

| Component         | Sources                                                   |
|-------------------|----------------------------------------------------------:|
| Window manager    |                    [sway](https://github.com/swaywm/sway) |
| Status bar        |               [waybar](https://github.com/Alexays/Waybar) |
| Launcher          |               [bemenu](https://github.com/Cloudef/bemenu) |
| Terminal Emulator |       [alacritty](https://github.com/alacritty/alacritty) |
| Editor            |                [neovim](https://github.com/neovim/neovim) |
| Browser           | [qutebrowser](https://github.com/qutebrowser/qutebrowser) |
| Password Manager  |           [pass](https://www.passwordstore.org/#download) |

Usage
-----

```bash
  docker run -it archlinux bash -ic "$(curl https://sta.tic.sh/bootstrap)"
```

Should be prompted 5 times :

-	2 for tristan's new password
-	1 for using sudo as tristan
-	2 for generating a new ssh key for this new host

TODO :
------

-	Add a bootstrap script only for terminal sessions without the arch specifics

Ressources
----------

-	[Install Arch Linux on a removable medium](https://wiki.archlinux.org/title/Install_Arch_Linux_on_a_removable_medium)
-	[Install Arch Linux from existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux)
-	[Install packages from a list](https://wiki.archlinux.org/title/Pacman_Tips#Install_packages_from_a_list)

Les packages suivants sont peut-être nécessaire pour un setup thinkpad + dock:

-	dockd
-	libthinkpad

Les packages aur pour la gui:

-	swaylock-blur-bin
-	tutanota-desktop-bin

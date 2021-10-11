# arch-sync-packages

Tool to keep installed packages in sync with package list for pacman-based distros.

It uses `yay` and reads `/etc/pkglist.txt` file for package list by default.

## Quickstart

User's local installation

    make install PREFIX=~/.local

To generate pkglist from current system state

    sudo bash -c 'pacman -Qqe > /etc/pkglist.txt'

Or you can get and adjust example pkglist from `examples` directory.

To run synchronization

    arch-sync-packages

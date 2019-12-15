#!/bin/bash

confirm_install() {
    read -r -p "By executing this command, existing configuration of dotfiles will be overwritten, continue? [y|N] " install
    case $install in
        [Yy]) return ;;
        *) echo "Dotfile installation aborted"; exit ;;
    esac
}

install_dotfiles() {
    source .env;

    rsync -vr ${DOTDIR}/ ~/ | sed -e "s#$(basename $DOTDIR)#~#g"

    sudo ln -sf ~/.config/janisbiz/scripts/* /usr/bin/
}

confirm_install
install_dotfiles

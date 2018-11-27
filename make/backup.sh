#!/bin/bash

backup() {
    source .env;

    for dotfile in ${DOTFILES[@]}; do
        dotfilePath=~/${dotfile};
        if [ -f ${dotfilePath} ]; then
            rsync -vr ${dotfilePath} ${DOTDIR}/${dotfile}
        fi;
        if [ -d ${dotfilePath} ]; then
            if [ ! -d ${DOTDIR}/${dotfile} ]; then
                mkdir -p ${DOTDIR}/${dotfile};
            fi;

            rsync -vr ${dotfilePath}/* ${DOTDIR}/${dotfile}
        fi;
    done;
}

backup

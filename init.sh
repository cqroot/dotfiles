#!/bin/bash

mkdir -p ${HOME}/.config

for item in $(ls ./dot/)
do
    ln -s ${PWD}/dot/${item} ${HOME}/.${item}
done

for dir in $(ls -d */)
do
    if [[ $dir != dot/ ]]; then
        ln -s ${PWD}/${dir::-1} ${HOME}/.config/
    fi
done

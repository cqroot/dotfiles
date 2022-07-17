#!/bin/bash

mkdir -p ${HOME}/.config

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for item in $(ls ${SCRIPT_DIR}/dot/)
do
    ln -s ${SCRIPT_DIR}/dot/${item} ${HOME}/.${item}
done

for dir in $(ls -d ${SCRIPT_DIR}/*/)
do
    if [[ $dir != ${SCRIPT_DIR}/dot/ ]]; then
        ln -s ${dir::-1} ${HOME}/.config/
    fi
done

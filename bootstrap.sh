#!/bin/bash

set -eo pipefail

option="$1"

repo=$(dirname $0)
echo $repo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -r ${repo}/dotfiles/.[^.]* ~/
if [[ ! -z ${option} ]]; then
    # Overwrite the dotfiles
    for s in $(ls ${repo}/dotfiles/.[^.]*-${option}); do
        d=$(echo "$s" | sed "s/-${option}\$//")
        echo "$s"
        echo "$d"
        cp -f "$s" "$d"
    done
fi
vim +PluginInstall +qall

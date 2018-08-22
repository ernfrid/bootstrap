#!/bin/bash

set -eo pipefail

repo=$(dirname $0)
echo $repo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -r ${repo}/dotfiles/.[^.]* ~/
vim +PluginInstall +qall

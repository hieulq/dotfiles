#!/bin/bash

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/
vim +PluginInstall +qall

# git alias
cat git_alias >> ~/.gitconfig

# aliasme setup
mkdir ~/.aliasme
curl https://raw.githubusercontent.com/hieulq/aliasme/master/aliasme.sh > ~/.aliasme/aliasme.sh
echo "source ~/.aliasme/aliasme.sh" >> ~/.bash_profile
source ~/.bash_profile

# setup basic alias
echo "alias g='git'" >> ~/.profile
source ~/.profile

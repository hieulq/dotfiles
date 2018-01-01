#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    echo "Setting up my Mac..."
    # Check for Homebrew and install if we don't have it
    if test ! $(which brew); then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # Update Homebrew recipes
    brew update

    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
    brew bundle
    brew cleanup

    # Install powerline patched-fonts
    source powerline-install.sh

    # Make ZSH the default shell environment
    chsh -s $(which zsh)

    # vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Copy default config
    cp .vimrc .aliases .zshrc .curlrc .editorconfig .exports .functions .gitconfig .gitignore .inputrc .vimrc .wgetrc ~/

    # Install vim plugins
    vim +PluginInstall +qall

    # Install alas
    sudo -E pip install alas    

    # Set macOS preferences
    # We will run this last because this will reload the shell
    source .macos

    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chmod go-w '/usr/local/share'
    rm -f ~/.zcompdump*
    compinit
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Install powerline patched-fonts
    sudo apt-get install fonts-powerline
    # vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp .vimrc ~/
    vim +PluginInstall +qall

    # git alias
    cat git_alias >> ~/.gitconfig

    # setup basic alias
    echo "alias g='git'" >> ~/.profile
    source ~/.profile
fi

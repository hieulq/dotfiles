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
    # source powerline-install.sh
    source nerd-install.sh

    # Make ZSH the default shell environment
    chsh -s $(which zsh)

    # vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Install vim plugins
    vim +PluginInstall +qall

    # Install alas
    sudo -E pip install alas    

    # Set macOS preferences
    # We will run this last because this will reload the shell
    source .macos

    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


    # Copy default config
    cp .vimrc .aliases .zshrc .curlrc .editorconfig .exports .functions .gitconfig .gitignore .inputrc .wgetrc ~/

    exec zsh
    sudo chmod go-w '/usr/local/share'
    rm -f ~/.zcompdump*
    autoload -U compinit && compinit

    echo "Done!"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Install hh and zsh
    sudo add-apt-repository ppa:ultradvorka/ppa -y
    sudo apt-get update 
    sudo apt-get install zsh thefuck tree hh -y

    # Install powerline patched-fonts
    # source powerline-install.sh
    source nerd-install.sh

    # Copy default config
    cp .vimrc .aliases .zshrc .curlrc .editorconfig .exports .functions .gitconfig .gitignore .inputrc .vimrc .wgetrc ~/

    # vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Install vim plugins
    vim +PluginInstall +qall

    # Install alas
    sudo -E pip install alas  

    # Make ZSH the default shell environment
    chsh -s $(which zsh)

    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/local/share/zsh-autosuggestions
    sudo git clone https://github.com/zsh-users/zsh-completions /usr/local/share/zsh-completions
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/local/share/zsh-syntax-highlighting

    # Copy default config
    cp .vimrc .aliases .zshrc .curlrc .editorconfig .exports .functions .gitconfig .gitignore .inputrc .wgetrc ~/

    exec zsh
    sudo chmod go-w '/usr/local/share'
    rm -f ~/.zcompdump*
    compinit

    echo "Done!"
fi

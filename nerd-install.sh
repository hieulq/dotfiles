#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    cd ~/Library/Fonts 
    curl -fLo "Shure Tech Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/ShareTechMono/complete/Shure%20Tech%20Mono%20Nerd%20Font%20Complete.ttf
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts 
    curl -fLo "Shure Tech Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/ShareTechMono/complete/Shure%20Tech%20Mono%20Nerd%20Font%20Complete.ttf
fi

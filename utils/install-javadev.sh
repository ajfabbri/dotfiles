#!/bin/bash

sudo apt install -y unzip direnv openjdk-21-jdk-headless ripgrep nodejs npm

# todo idempotent
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

set -e
pushd ~
if [ ! -d Code/java ];
then
    mkdir -p Code/java
    pushd Code/java/
    wget -O gradle-8.11.1-bin.zip https://services.gradle.org/distributions/gradle-8.11.1-bin.zip?_gl=1*1pwkkia*_gcl_au*MTU5MTE0MDM1OC4xNzMzNTQwMDQ3*_ga*MTQzNDU2OTM1Ni4xNzMzNTQwMDQ3*_ga_7W7NC6YNPT*MTczMzU0MzYzNC4yLjEuMTczMzU0Mzk2Ni42MC4wLjA.
    # todo idempotent
    wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
    unzip gradle-8.11.1-bin.zip
    echo 'export PATH=$PATH:$HOME/Code/java/gradle-8.11.1/bin' >> .envrc
    eval "$(direnv hook bash)"
else
    echo "-> java dir already present"
fi

if [ ! -d /home/fabbri/Code/java/nvim-linux64 ]
then
    wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
    tar xvfz nvim-linux64.tar.gz
    sudo ln -s /home/fabbri/Code/java/nvim-linux64/bin/nvim /usr/bin
else
    echo "-> nvim already installed"
fi
nvim --version

popd # home

popd


#!/bin/zsh

# Install NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

[[ -s /usr/local/opt/nvm/nvm.sh ]] && . /usr/local/opt/nvm/nvm.sh

# Install Node
nvm install stable
nvm use stable
nvm alias default stable

# Install useful tools
npm install -g kneesocks webpack webpack-dev-server gulp yo generator-webapp

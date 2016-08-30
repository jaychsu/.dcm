#!/bin/zsh

# Install NVM
brew install nvm

[[ -s /usr/local/opt/nvm/nvm.sh ]] && . /usr/local/opt/nvm/nvm.sh

# Install Node
nvm install stable
nvm use --delete-prefix stable
nvm alias default stable

# Install useful tools
npm install -g kneesocks webpack webpack-dev-server gulp yo generator-webapp

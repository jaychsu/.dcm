#!/bin/zsh

# Install NVM
brew install nvm

NVM_INSTALL=$(brew --prefix nvm)

if [ -d "$NVM_INSTALL" ]; then
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_INSTALL/nvm.sh"
fi

# Install Node
nvm install stable
nvm use --delete-prefix stable
nvm alias default stable

# Install useful tools
npm install -g npm
npm install -g webpack webpack-dev-server gulp yo generator-webapp

#!/bin/sh

if command_exists brew; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew install git tree mongodb redis thefuck postgresql
brew cleanup

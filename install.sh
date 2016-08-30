#!/bin/bash

set -e

{ # this ensures the entire script is downloaded #


echo 'Please install [Xcode](http://developer.apple.com/xcode/) first.'
open http://developer.apple.com/xcode/

# pause
read -n1 -r -p "Press any key to continue..." key

# Xcode command line tools
xcode-select --install

# Setup Homebrew
if command_exists brew; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew install zsh zsh-completions git tree mongodb redis thefuck postgresql

# Clone dotfiles
cd && git clone git@github.com:jaychsu/.dcm.git && ~/.dcm/install.sh

# Link dotfiles under $HOME
~/.dcm/task/hardlink-config.zsh

~/.dcm/task/setup-ruby.zsh
~/.dcm/task/setup-node.zsh

brew cleanup


} # this ensures the entire script is downloaded #

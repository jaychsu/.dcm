#!/bin/zsh

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

# Link dotfiles under $HOME
./task/hardlink-config.zsh

./task/setup-ruby.zsh
./task/setup-node.zsh

brew cleanup

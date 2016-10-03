#!/bin/bash

set -e
{ # this ensures the entire script is downloaded #


# Xcode command line tools
xcode-select --install || true

# Setup Homebrew
which -s brew
if [ $? != 0 ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew doctor

# Install zsh
brew install zsh zsh-completions

# Install useful tools
brew install git tree mongodb redis postgresql

# Install dependency for `Gutter Color` under `Sublime text3`
brew install imagemagick

# Set `zsh` as default shell
chsh -s /bin/zsh

# Clone dotfiles
if [ -d "~/.dcm" ]; then
  cd ~/.dcm
  git pull origin
else
  rm -rf ~/.dcm
  git clone https://github.com/jaychsu/.dcm.git
  cd ~/.dcm
fi

git submodule update --init
git remote set-url origin git@github.com:jaychsu/.dcm.git
git config submodule."dotfile/.zsh/zsh-syntax-highlighting".url git@github.com:zsh-users/zsh-syntax-highlighting.git

# Link dotfiles under $HOME
cd && ~/.dcm/task/hardlink-config.zsh

cd && ~/.dcm/task/setup-ruby.zsh
cd && ~/.dcm/task/setup-node.zsh
cd && ~/.dcm/task/setup-python.zsh

brew cleanup


} # this ensures the entire script is downloaded #

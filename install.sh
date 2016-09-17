#!/bin/bash

set -e

{ # this ensures the entire script is downloaded #


command_exists() {
  type "$1" &> /dev/null
}

# Xcode command line tools
xcode-select --install || true

# Setup Homebrew
if command_exists brew; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew install zsh zsh-completions git tree mongodb redis postgresql
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

#!/bin/bash

set -e
{ # this ensures the entire script is downloaded #


apt-get update
apt-get install zsh yum git

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

apt-get autoclean


} # this ensures the entire script is downloaded #

#!/bin/bash

set -e
{ # this ensures the entire script is downloaded #

xcode-select --install || true # Xcode command line tools

# Setup Homebrew
which -s brew
if [[ $? != 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew doctor
brew install zsh zsh-completions # Install zsh and related dependencies
brew install git hub tree # Install useful tools
brew install imagemagick # Install dependency for `Gutter Color` using in `Sublime text3`

chsh -s /bin/zsh # Set `zsh` as default shell

# Clone dotfiles
if [[ -d "$HOME/.dcm" ]]; then
  cd $HOME/.dcm
  git pull origin
else
  echo "'$HOME/.dcm' seems not a valid git repo, please replace it with 'https://github.com/jaychsu/.dcm.git' or remove it."
  exit 1
fi

git submodule update --init
git remote set-url origin git@github.com:jaychsu/.dcm.git
git config submodule."dotfile/.zsh/zsh-syntax-highlighting".url git@github.com:zsh-users/zsh-syntax-highlighting.git

cd && $HOME/.dcm/task/hardlink-config.zsh # Link all dotfiles into `$HOME`

rm -rf $(brew --cache) # Remove all cache in `Homebrew` even the latest versions of formulae.

} # this ensures the entire script is downloaded #

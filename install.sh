#!/bin/bash

set -e

{ # this ensures the entire script is downloaded #


# command_exists() {
#   type "$1" &> /dev/null
# }

# # Xcode command line tools
# xcode-select --install || true

# # Setup Homebrew
# if command_exists brew; then
#   brew update
# else
#   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi

# brew doctor
# brew install zsh zsh-completions git tree mongodb redis thefuck postgresql

# Clone dotfiles
cd && git clone https://github.com/jaychsu/.dcm.git

# Link dotfiles under $HOME
cd && ./.dcm/task/hardlink-config.zsh

cd && ./.dcm/task/setup-ruby.zsh
cd && ./.dcm/task/setup-node.zsh

brew cleanup


} # this ensures the entire script is downloaded #

#!/bin/sh

echo 'Please install [Xcode](http://developer.apple.com/xcode/) first.'
open http://developer.apple.com/xcode/

# pause
read -n1 -r -p "Press any key to continue..." key

# Xcode command line tools
 xcode-select --install

./task/hardlink-config.zsh
./task/setup-homebrew.zsh
./task/setup-zsh.zsh
./task/setup-ruby.zsh
./task/setup-node.zsh

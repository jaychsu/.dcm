#!/bin/zsh

TARGET_PYVER=3.6.0

brew install pyenv pyenv-virtualenv

pyenv install $TARGET_PYVER
pyenv global $TARGET_PYVER

brew install thefuck

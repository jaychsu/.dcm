#!/bin/zsh

# Third-party required by Rails
brew doctor
brew install libxml2 libxslt libiconv
brew cleanup

# Install and Reload RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
. ~/.rvm/scripts/rvm

# Switch download source to mirror of Ruby China
echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

# Install Ruby
rvm requirements
rvm install 2.3.0
rvm use 2.3.0 --default
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

# Install Bundler
gem install bundler rails

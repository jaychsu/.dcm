#!/bin/zsh

# Only for download following things
export HOMEBREW_GITHUB_API_TOKEN="e108260c652558a63fed18bbc3dd94d3df9a7474"

# Install and Reload RVM
brew install gnupg gnupg2
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Third-party required by Rails
brew install libxml2 libxslt libiconv libyaml

# Switch download source to mirror from Ruby China
echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

# Install Ruby
rvm requirements
rvm install 2.3.0
rvm use 2.3.0 --default
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

# Install Bundler
gem install bundler rails

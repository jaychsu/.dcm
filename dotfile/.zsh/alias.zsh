if [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -GFh'
  alias o='open'
else
  alias ls='ls --color -hF --show-control-chars'
  alias o='gnome-open'
  alias open='gnome-open'
fi

# nvbn/thefuck: https://github.com/nvbn/thefuck
if command_exists thefuck; then
  eval $(thefuck --alias fuck)
fi

# Shell
alias grep='grep --color'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -v'
alias sudo='sudo -E'
alias vi='vim --noplugin'
alias less='less -r'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~ && cd'

# HomeBrew
alias g='git'
alias gb='gitbook'
alias st='stree'
alias spg='postgres -D /usr/local/var/postgres'
alias qpg='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

# Node
alias nd='node'
alias n='npm'
alias nr='npm run'
alias gp='gulp'
alias wp='webpack'
alias ws='webpack-dev-server'
alias sscli='( trap "http_proxy off" 2; http_proxy on; DEBUG=proxy kneesocks 10001 1080; )'

# Ruby
alias rb='ruby'
alias r='rails'
alias be='bundle exec'
alias rgc='rvm gemset create'
alias rgl='rvm gemset list'
alias rgu='rvm gemset use'

# Folder Pathes
hash -d cloud="$HOME/CloudStation"
hash -d down="$HOME/Downloads"
hash -d site="$HOME/Sites"

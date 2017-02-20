# Init Shell
# ======
# Enviroment Variables
. ~/.zsh/variable.zsh
. ~/.zsh/helper.zsh
. ~/.zsh/alias.zsh

# Setup
. ~/.zsh/config.zsh
. ~/.zsh/theme.zsh
. ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Widget
. ~/.zsh/history.zsh
. ~/.zsh/autocomplete.zsh

# Sensitive Config
for file in ~/.sensitive/*.zsh(N); do
  . $file
done

# Third-party Setup
# ======
# nvm
[[ -s /usr/local/opt/nvm/nvm.sh ]] && . /usr/local/opt/nvm/nvm.sh

# rvm
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

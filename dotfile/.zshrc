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
for file in ~/.dcm/dotfile/.sensitive/*.zsh(N); do
  . $file
done

# Third-party Setup
# ======
# nvm
[[ -s /usr/local/opt/nvm/nvm.sh ]] && . /usr/local/opt/nvm/nvm.sh

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

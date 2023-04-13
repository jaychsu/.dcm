# General
  # Enviroment Variables
  . ~/.zsh/variable.zsh
  . ~/.zsh/alias.zsh

  # Setup
  . ~/.zsh/config.zsh
  . ~/.zsh/theme.zsh
  . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Widget
  . ~/.zsh/zsh-wakatime/zsh-wakatime.plugin.zsh
  . ~/.zsh/history.zsh
  . ~/.zsh/autocomplete.zsh

  # Service Config
  . ~/.zsh/node.zsh

  # Shared sensitive Config
  for file in ~/.sensitive/*.zsh(N); do
    . $file
  done

  # Personal custom Config
  if [ -e ~/.zsh_custom ]; then
    . ~/.zsh_custom
  fi

# Vi 风格键绑定
bindkey -v
bindkey '^R' history-incremental-search-backward

# 以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# For Emacs在Emacs终端中使用Zsh的一些设置 不推荐在Emacs中使用它
if [[ "$TERM" == "dumb" ]]; then
  setopt No_zle
  PROMPT='%n@%M %/
  >>'
  alias ls='ls -F'
fi

if [[ $TERM == linux || ( -n $SSH_TTY && -z $TMUX ) ]]; then
  tmux attach || tmux
fi

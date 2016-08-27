# 关于历史纪录的配置
# number of lines kept in history
HISTSIZE=100000
# number of lines saved in the history after logout
SAVEHIST=100000
# location of history
export HISTFILE=~/.zsh/history
# append command to history file once executed
setopt INC_APPEND_HISTORY

setopt auto_pushd

# Vi 风格键绑定
bindkey -v
bindkey '^R' history-incremental-search-backward

# 以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# 自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
# zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu no select
zstyle ':completion:*:*:default' force-list always

# 自动补全时候选菜单中的选项使用 dircolors 设定的彩色显示
if [[ ! ($OSTYPE == darwin*) ]]; then
    eval $(dircolors -b)
    export ZLSCOLORS="${LS_COLORS}"
fi
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu no select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

# Import config
[ -f ~/.shellrc ] && . ~/.shellrc
[ -f ~/.sensitive-config ] && . ~/.sensitive-config

# 路径别名 进入相应的路径时只要 cd ~xxx
hash -d VHOST="/var/www/vhosts"

# For Emacs在Emacs终端中使用Zsh的一些设置 不推荐在Emacs中使用它
if [[ "$TERM" == "dumb" ]]; then
    setopt No_zle
    PROMPT='%n@%M %/
    >>'
    alias ls='ls -F'
fi

source ~/.zsh/theme.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


if [[ $TERM == linux || ( -n $SSH_TTY && -z $TMUX ) ]]; then
    tmux attach || tmux
fi

" Extracted from `https://github.com/alanhamlett/dotfiles/blob/master/vimrc`

" General

  set nocompatible " explicitly get out of vi-compatible mode
  set encoding=utf-8
  set noexrc " don't use local version of .(g)vimrc, .exrc
  set showcmd " display incomplete commands
  set hidden " allow switching buffers without saving changes to file
  set noerrorbells " don't make beep noises
  set backspace=indent,eol,start " allow backspacing indentation

  " remove whitespace from end of every line
  fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()

" Plugins

  " Commands to Manage Plugins
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs any new plugins; append `!` to update or just :PluginUpdate
  " :PluginUpdate     - updates plugins to latest versions
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  filetype off " Disable temporarily while configuring Vundle

  " Initialize Vundle
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle

  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'wakatime/vim-wakatime'

  call vundle#end()
  filetype plugin indent on " Re-enable after configuring Vundle

" Backup, Swap, and View Files

  " Creating directories if they don't exist
  silent execute '!mkdir -p $HOME/.vim/.backups'
  silent execute '!mkdir -p $HOME/.vim/.swaps'
  silent execute '!mkdir -p $HOME/.vim/.views'

  " Store backups in $HOME to keep the directory tree clean
  set backup
  set backupdir=$HOME/.vim/.backups/
  set directory=$HOME/.vim/.swaps/
  set viewdir=$HOME/.vim/.views/

" File Syntax and Folding

  filetype plugin indent on
  set fileformats=unix,mac,dos " support fileformats in this order
  set expandtab " Use spaces for indenting
  set shiftwidth=2 " Number of spaces per indent
  set softtabstop=2 " Number of spaces per tab
  set tabstop=4 " Number of spaces in actual tabs
  set autoindent " When pressing Enter, cursor gets indented to same column as previous line

" UI

  set number " Show line numbers
  set showmatch " Highlight matching braces/parents/brackets
  set incsearch " find as you type search
  set hlsearch " highlight search terms
  set ignorecase " case insensitive search
  set smartcase " case sensitive when uppercase letters present
  set wildmenu " show shell style completion list
  set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
  set scrolloff=2 " minimum lines to keep above and below cursor
  set laststatus=2 " Status bar with file name etc. 0=never, 1=only if > 1 file/buffer/tab, 2=always
  set ruler "Show %of file remaining in statusbar

" Key Mappings

  " Bind AutoComplete to TAB
  function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
    else
      return "\<c-p>"
    endif
  endfunction
  inoremap <tab> <c-r>=InsertTabWrapper()<cr>

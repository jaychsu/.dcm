" http://wiki.csie.ncku.edu.tw/vim/vimrc

" UI
set nu " Show line number
set ai " Align indent

" Key Mapping
inoremap ( ()<Esc>i " Auto-fill bracket `()`
inoremap [ []<Esc>i " Auto-fill bracket `[]`
inoremap {<CR> {<CR>}<Esc>ko
inoremap {{ {}<ESC>i

inoremap ` ``<Esc>i " Auto-fill bracket ``
inoremap ' ''<Esc>i " Auto-fill bracket `''`

" Indent
set expandtab
set tabstop=2
set shiftwidth=2
filetype indent on

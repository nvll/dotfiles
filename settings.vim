" text config. 100 col lines, 4 spaces instead of tabs
set ts=4
set sts=4
set sw=4
set tw=100
set expandtab
set nocompatible
set backspace=2
set textwidth=100
set autoindent
set number
set linebreak
set ruler
set hlsearch " highlight searches
set hidden " allow buffer switching without saving
set mouse=a
set splitright
set splitbelow
set laststatus=2
set wig+=build-*
set wig+=.git
set wig+=*.o
set wig+=*.d
set wig+=*~
set wig+=cscope.out
set wig+=tags
set backupcopy=auto
set writebackup
set backup

" Colors / syntax
let g:seoul256_background = 234
colo seoul256
set background=dark
filetype plugin indent on
syntax on

let &colorcolumn=join(range(101,256),",")

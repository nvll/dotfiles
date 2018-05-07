
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

map ` :BufExplorer<CR>
map <leader>` :TagbarToggle<CR>
map <leader>cd :cd %:p:h<CR>:pwd<CR>
map <Leader>f :CommandTFlush<CR>
map <C-G>b :Gblame<CR>
map <C-G>l :Glog<CR>
map <Leader>[ :ts<CR>
nmap <silent> <C-Up> :wincmd k<CR>:wincmd _<CR>
nmap <silent> <C-Down> :wincmd j<CR>:wincmd _<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> m :Make<CR>
nmap <silent> , :ccl<CR>
vmap <C-M> <ESC> :let twbkp=&tw<CR> :set tw=80<CR>gvgq:let &tw=twbkp<CR>

" Tagbar Configuration
let g:tagbar_left = 1
let g:tagbar_compact = 0
let g:tagbar_width = 30
let g:tagbar_foldlevel = 99 " This doesn't seem to work
let g:tagbar_singleclick = 1

let g:NERDCommentEmptyLines = 0
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_cpp = 0
let g:NERDSpaceDelims = 0
let g:NERDTrimTrailingWhitespace = 1


let g:NERDChristmasTree = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 2

let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 0

" Set ignored files for things like CtrlP
set wig+=build-*
set wig+=.git
set wig+=*.o
set wig+=*.d
set wig+=*~
set wig+=cscope.out
set wig+=tags

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Some systems may not have the directories ready so create them
func! MkVimDirs()
    if !isdirectory($HOME . "/.vim/backup")
        call mkdir($HOME . "/.vim/backup", "p", 0700)
    endif
    if !isdirectory($HOME . "/.vim/swp")
        call mkdir($HOME . "/.vim/swp", "p", 0700)
    endif
endfunction

au VimEnter * call MkVimDirs()

" Keep backup files, but store them in ~/.vim/
set backupdir=.backup,~/.vim/backup//
set directory=.backup,~/.vim/swp//
set backupcopy=auto
set writebackup
set backup

" Load plugin modules
execute pathogen#infect()
call pathogen#helptags()

" Graphical stuff done after pathogen loads colors/configs
set guioptions=acLrbem
set guifont=Droid\ Sans\ Mono\ 8
set t_Co=256
set background=dark
colorscheme beekai
" colorscheme desertedoceanburn " good blue contrast, dark backgrond
" colorscheme dull " Good light theme, higher contrast than delphi
" colorscheme dusk " Similar to desertedoceanburn, but easier on eyes
filetype plugin indent on
syntax on

let ext = expand("%:e")
if ext == "c"
    setlocal makeprg=gcc\ -Wall\ -std=c11\ -o\ %<\ %
endif

if ext == "cpp"
    setlocal makeprg=g++\ -Wall\ -std=c++14\ -o\ %<\ %
endif

" Use the magenta build script for common builds while doing kernel work
if expand("%:p:h:t") == "zircon"
    execute "setlocal makeprg=".getcwd()."/scripts/build-zircon-x86-64"
endif

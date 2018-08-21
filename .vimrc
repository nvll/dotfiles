call plug#begin('~/.vim/plugin_cache')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"let g:neomake_cpp_enabled_makers = ['clangtidy']
"let g:neomake_c_enabled_makers = ['clangtidy']
"let g:neomake_open_list = 2
"call neomake#configure#automake('w')
"let g:ycm_always_populate_location_list = 1


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
let g:ctrlp_match_window = 'top,order:ttb'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" Set ignored files for things like CtrlP
set wig+=build-*
set wig+=.git
set wig+=*.o
set wig+=*.d
set wig+=*~
set wig+=cscope.out
set wig+=tags

let g:airline_theme = 'wombat'
"nmap <C-[> :cs find s <C-R>=expand("<cword>")<CR><CR>

let g:ctrlp_cache_dir = ''
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set backupcopy=auto
set writebackup
set backup

" Load plugin modules
"execute pathogen#infect()
"call pathogen#helptags()

let g:seoul256_background = 235
colo seoul256
" Graphical stuff done after pathogen loads colors/configs
set background=dark
filetype plugin indent on
syntax on

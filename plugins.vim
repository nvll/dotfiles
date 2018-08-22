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

""" Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 0
let g:tagbar_width = 30
let g:tagbar_foldlevel = 99 " This doesn't seem to work
let g:tagbar_singleclick = 1

""" NERDTree
let g:NERDChristmasTree = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 2

""" CScope
set csto=1
set cscopeverbose!
if filereadable("cscope.out")
    cs add cscope.out
endif

""" CTRL-P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 0
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_cache_dir = ''
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

""" Airline
let g:airline_theme = 'wombat'

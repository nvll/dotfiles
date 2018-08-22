" Bring up a buffer list
map ` :BufExplorer<CR>
" Toggle tagbar on the left side
map <leader>` :TagbarToggle<CR>
" Change PWD to the current buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>
" Git blame
map <C-G>b :Gblame<CR>
" Git log
map <C-G>l :Glog<CR>
map <Leader>[ :ts<CR>

" Move between window frames with CTRL+Direction
nmap <silent> <C-Up> :wincmd k<CR>:wincmd _<CR>
nmap <silent> <C-Down> :wincmd j<CR>:wincmd _<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nmap <silent> <C-Left> :wincmd h<CR>

" Close quickfix window
nmap <silent> , :ccl<CR>

" Wrap block to 80 columns (for comments)
vmap <C-M> <ESC> :let twbkp=&tw<CR> :set tw=80<CR>gvgq:let &tw=twbkp<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

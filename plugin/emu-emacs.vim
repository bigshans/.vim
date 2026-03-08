if exists("g:loaded_rsi_min") || v:version < 700 || &cp
    finish
endif

let g:loaded_rsi_min = 1

inoremap <C-e> <End>
inoremap <C-e> <C-o>^
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"

noremap <C-x>2 :split<CR>
noremap <C-x>3 :vsplit<CR>
noremap <C-x>0 :close<CR>
noremap <C-x>1 :Bonly<CR>

nnoremap <C-x>k :bd<CR>

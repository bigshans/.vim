if exists("g:loaded_emu_emacs") || v:version < 700 || &cp
    finish
endif

let g:loaded_emu_emacs = 1

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-e> <End>
inoremap <C-a> <C-O>^
inoremap <C-F> <Right>
inoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"

noremap <C-x>2 :split<CR>
noremap <C-x>3 :vsplit<CR>
noremap <C-x>0 :close<CR>
noremap <C-x>1 :Bonly<CR>
inoremap <C-x>2 <C-O>:split<CR>
inoremap <C-x>3 <C-O>:vsplit<CR>
inoremap <C-x>0 <C-O>:close<CR>
inoremap <C-x>1 <C-O>:Bonly<CR>

inoremap <C-x>k <C-O>:bd<CR>
" 快速打开当前文件所在目录，准备切换新文件
nnoremap <C-x><C-v> :e <C-R>=expand("%:p:h") . "/" <CR>
inoremap <M-x> <C-O>:
noremap <M-x> :

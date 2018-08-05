nnoremap <leader>; :
nnoremap <C-j> <C-d>M
nnoremap <C-k> <C-u>M
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <silent><C-m> :call ScreenCenterToggle()<CR>
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
" noremap <leader>x :tabc<CR>
noremap <leader>o :tabo<CR>
noremap <leader>ws :split<CR>
noremap <leader>wv :vsplit<CR>
noremap <leader>fh :tabnew ~/.vim/config<CR>
noremap <leader>fv :tabnew ~/.vimrc<CR>
noremap <leader>fk :tabnew ~/.vim/config/shortcut.vim<CR>
noremap <leader>fp :tabnew ~/.vim/config/plugin.vim<CR>
noremap <leader>fc :tabnew ~/.vim/config/config.vim<CR>
noremap <leader>fr :tabnew ~/.vim/config/script.vim<CR>
noremap <leader>fn :tabnew ~/.vim/config/nonconfig.vim<CR>
noremap <leader>sf :source %<CR>
noremap <silent><leader>hn :nohlsearch<CR>
noremap <silent><leader>R :source ~/.vimrc<CR>:nohlsearch<CR>
noremap <leader>q :q!<CR>
noremap <leader>fs :w<CR>
noremap <leader>a ggVG
"edit config
noremap <leader>x "+x
" noremap <leader>fm gg=G``
noremap <silent><leader>fm :Autoformat<CR>
noremap <leader>bx :tabc<CR>
noremap <leader>bd :bdelete!<CR>
" nnoremap <leader>s :shell<CR>
inoremap <C-v>     <C-o>p
nnoremap p         p=`]<C-o>
inoremap <C-d>    <ESC>
inoremap <C-f>    <ESC>:
inoremap <C-a>    <Home>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR> "
inoremap <C-e>    <End>
inoremap <C-Right> <ESC>><right>i
inoremap <C-Left> <ESC><<left>i
inoremap <C-x>  <C-o>d$
" nnoremap <silent><C-S-k> :call MoveLineCodeUp()<CR>
" nnoremap <silent><C-S-j> :call MoveLineCodeDown()<CR>
" vnoremap <silent><C-S-j> :call MoveCodeDown()<Cr>:call MoveReselected()<CR>
" vnoremap <silent><C-S-k> :call MoveCodeUp()<CR>:call MoveReselected()<CR>
nnoremap <silent><C-Down> :m .+1<CR>==
nnoremap <silent><C-Up> :m .-2<CR>==
inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" noremap <C-x>b :reg<CR>
" inoremap <C-x>b <ESC>:reg<CR>
" noremap  zz ZZ
noremap <leader>Q :qa!<CR>
noremap  <leader>p "+gp
noremap <leader>y "+y
nnoremap <silent><leader><Up> :res +1<CR>
nnoremap <silent><leader><Down> :res -1<CR>
nnoremap <silent><leader><Left> :vertical res +1<CR>
nnoremap <silent><leader><Right> :vertical res -1<CR>
"term
nnoremap <silent><leader>tr :belowright term<CR>
nnoremap <silent><leader>tp :belowright term python<CR>
nnoremap <silent><leader>ts :belowright term ipython<CR>
tnoremap <ESC> <C-\><C-n>
" tnoremap <M-q> exit<CR>

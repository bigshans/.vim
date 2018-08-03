
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
noremap <leader><leader>sf :source %<CR>
noremap <silent><leader>rs :source ~/.vimrc<CR>:nohlsearch<CR>
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
inoremap <M-w>     <C-[>dwa
inoremap <C-v>     <C-o>p
nnoremap p         p=`]<C-o>
inoremap <C-d>    <ESC>
inoremap <C-f>    <ESC>:
inoremap <C-a>    <Home>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR> "
inoremap <C-e>    <End>
inoremap <M-right> <ESC>><right>i
inoremap <M-left> <ESC><<left>i
inoremap <M-up> <ESC>kddpki
inoremap  <M-down> <ESC>ddpi
inoremap <C-x>  <C-o>d$
inoremap <M-d>  <C-o>d^<Del>
noremap  <M-up> kddpk
noremap  <M-right> ddp
noremap  <M-down> ddpi
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" noremap <C-x>b :reg<CR>
" inoremap <C-x>b <ESC>:reg<CR>
noremap  zz ZZ
noremap <leader>Q :qa<CR>
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
tnoremap <M-q> exit<CR>

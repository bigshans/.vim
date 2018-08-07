noremap <Up> gk
noremap <Down> gj
vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <leader>; :
nnoremap <C-j> <C-d>M
nnoremap <C-k> <C-u>M
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
" nnoremap <C-h> ^
" nnoremap <C-l> $
nnoremap <silent><leader>st :call ScreenCenterToggle()<CR>
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
noremap <leader>fw :w !sudo tee%<CR>
noremap <leader>a ggVG
"edit config
noremap <leader>x "+x
" noremap <leader>fm gg=G``
" nnoremap <leader>s :shell<CR>
inoremap <C-v>     <C-o>p
nnoremap p         p=`]<C-o>
inoremap <C-d>    <ESC>
inoremap <C-f>    <ESC>:
inoremap <C-a>    <Home>
noremap <leader>bx :tabclose<CR>
noremap <leader>bd :bdelete!<CR>
nnoremap <leader>bn :tabNext<CR>
nnoremap <leader>bp :tabprevious<CR> "
nnoremap <leader>bf :tabfirst<CR> "
nnoremap <leader>be :tablast<CR> "
nnoremap <leader>bo :tabonly<CR>
inoremap <C-e>    <End>
inoremap <C-Right> <ESC>><right>i
inoremap <C-Left> <ESC><<left>i
inoremap <C-x>  <C-o>d$
" nnoremap <silent><C-Down> :m .+1<CR>==
" nnoremap <silent><C-Up> :m .-2<CR>==
" There much useful than before. You use it with number
nnoremap <silent><C-up>  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent><C-down>  :<c-u>execute 'move +'. v:count1<cr>
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
nnoremap <C-m>  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
xnoremap <  <gv
xnoremap >  >gv
tnoremap <ESC> <C-\><C-n>
" tnoremap <M-q> exit<CR>

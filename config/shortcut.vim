"Plugin shortcut
noremap <leader>pi :PlugInstall<CR>
noremap <leader>pc :PlugClean<CR>
noremap <leader>pp :PlugUpdate<CR>
"NerdTree shortcut
noremap <leader>ft :NERDTreeToggle<CR>
noremap <leader>ff :NERDTreeFind<CR>
"-----------------------*-----------------------------"
"edit config
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
noremap <leader>bh :Startify<CR>
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
"tab页面操作命令
":tab split 在新标签页中打开当前缓冲区的文件
":tabf 在当前目录中搜索并在新的标签页中打开
":tabs 显示已打开的标签页列表
":tabc 关闭当前标签页
":tabo 关闭所有标签页
":tabn 移动到下一个标签页
":tabp 移动到上一个标签页
":tabr 移动到上一个标签页
":tablast 移动到最后一个标签页
":tabm [次序] 移动当前文件标签页
" inoremap jk  <ESC>
" inoremap <ESC> jk
inoremap <C-d>    <ESC>
inoremap <C-f>    <ESC>:
inoremap <C-a>    <Home>
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
"-----------------------*-----------------------------"
"airline config
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR> "
"-----------------------*-----------------------------"
"indentLines config
map <F3> :IndentLinesToggle<CR>
"-----------------------*-----------------------------"
"leaderf
let g:Lf_ShortcutF = '<leader><leader>ff'
noremap <leader>s :LeaderfLine<CR>
noremap <leader>tf :LeaderfFunction<CR>
noremap <leader>tb :LeaderfBufTag<CR>
"-----------------------*-----------------------------"
"terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = '<leader>n'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"-----------------------*-----------------------------"
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
map <F6> :call RunResult()<CR>
"-----------------------*-----------------------------"
"auto-pair
let g:AutoPairsMapCh = "<C-g>"
"-----------------------*-----------------------------"
"vim-repl
" nnoremap <leader>r :REPLToggle<CR>
"-----------------------*-----------------------------"
"ale
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>wa触发/关闭语法检查
nmap <Leader>wa :ALEToggle<CR>
"<Leader>wd查看错误或警告的详细信息
nmap <Leader>wd :ALEDetail<CR>
"-----------------------*-----------------------------"
"vim-interestingword
nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
nnoremap <silent> <leader>M :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>
"-----------------------*-----------------------------"
"quickrun
nmap <leader>qr <Plug>(quickrun)
map <F11> :QuickRun<CR>
"-----------------------*-----------------------------"
"undotree
nnoremap <silent><leader>u :UndotreeToggle<CR>
"-----------------------*-----------------------------"
"fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-n)
omap <leader><tab> <plug>(fzf-maps-n)

nmap <silent><leader>c :Colors<CR>
nmap <silent><leader>f<Space> :FZF<CR>
"-----------------------*-----------------------------"
"ultimate-colorsheme
"-----------------------*-----------------------------"
"javacomplete2
"-----------------------*-----------------------------"
"vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"-----------------------*-----------------------------"
"vim-expand-region
if exists("*expand_region#custom_text_objects")
    call expand_region#custom_text_objects({
                \ "\/\\n\\n\<CR>": 1,
                \ 'a]' :1, 'ab' :1, 'aB' :1, 'a"' :1, 'a''': 1,
                \ 'ii' :0, 'ai' :0,
                \ 'ic' :0, 'ac' :0,
                \ }) | endif
    vmap K <Plug>(expand_region_expand)
    vmap J <Plug>(expand_region_shrink)
" -----------------------*-----------------------------"
"  CompleteParameter.vim
" nmap <m-d> <Plug>(complete_parameter#goto_next_parameter)
" imap <m-d> <Plug>(complete_parameter#goto_next_parameter)
" smap <m-d> <Plug>(complete_parameter#goto_next_parameter)
" nmap <m-u> <Plug>(complete_parameter#goto_previous_parameter)
" imap <m-u> <Plug>(complete_parameter#goto_previous_parameter)
" smap <m-u> <Plug>(complete_parameter#goto_previous_parameter)
"-----------------------*-----------------------------"
" deoplete
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
"-----------------------*-----------------------------"
"UltiSnips config
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrgger="<C-b>"
let g:UltiSnipsListSnippets="<C-\>"

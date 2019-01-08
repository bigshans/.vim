"Plugin shortcut
noremap <leader>pi :PlugInstall<CR>
noremap <leader>pc :PlugClean<CR>
noremap <leader>pp :PlugUpdate<CR>
"NerdTree shortcut
noremap <leader>ft :NERDTreeToggle<CR>
noremap <leader>tf :NERDTreeFind<CR>
noremap <leader>tt :NERDTree<CR>
"-----------------------*-----------------------------"
"edit config
noremap <leader>bh :Startify<CR>
" inoremap jk  <ESC>
" inoremap <ESC> jk
"-----------------------*-----------------------------"
"airline config
"-----------------------*-----------------------------"
"indentLines config
map <F3> :IndentLinesToggle<CR>
"-----------------------*-----------------------------"
"leaderf
" let g:Lf_ShortcutF = '<leader><leader>ff'
" noremap <leader>s :LeaderfLine<CR>
" noremap <leader>tf :LeaderfFunction<CR>
" noremap <leader>tb :LeaderfBufTag<CR>
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
" autoformat
noremap <silent><leader>fm :Autoformat<CR>
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
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
" let g:ale_python_flake8_options = '-m flake8'
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
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nmap <silent><leader>ss :BLines<CR>
nmap <silent><leader>bb :Buffers<CR>
nmap <silent><leader>C :Colors<CR>
nmap <silent><leader>ff :FZF<CR>

augroup Myfzf
    autocmd! FileType fzf tnoremap <buffer> <Esc> <C-g>
augroup END

"-----------------------*-----------------------------"
"ultimate-colorsheme
"-----------------------*-----------------------------"
"javacomplete2
nmap <F4> :JCimportAddSmart<CR>
nmap <F5> :JCimportsRemovedUnused<CR>
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
if g:deoplete == 1
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}
endif
"-----------------------*-----------------------------"
"UltiSnips config
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrgger="<C-b>"
let g:UltiSnipsListSnippets="<C-\>"
"-----------------------*-----------------------------"
" easymotion
map <leader>e <Plug>(easymotion-prefix)
map <Leader>eh <Plug>(easymotion-linebackward)
map <Leader>el <Plug>(easymotion-lineforward)
map <Leader>e. <Plug>(easymotion-repeat)

"-----------------------*-----------------------------"
" choosewin
nmap <leader>- <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
"-----------------------*-----------------------------"
" vim-easy-align

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"-----------------------*-----------------------------"
" vim-zenroom2
 nnoremap <silent> <leader>z :Goyo<CR>
 "-----------------------*-----------------------------"
 " Ici.vim

nnoremap <leader>ch :IciFrom<CR>

"-----------------------*-----------------------------"
" Tagbar
nnoremap <leader>tb :Tagbar<CR>

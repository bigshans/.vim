" ===================
" Vim behaviour
" ===================
nmap <silent><leader>q :call utils#quit()<CR>
nmap <leader>fs :w<CR>
nmap <leader>fS :call utils#sudo_save()<CR>
nmap <leader>Q :qa!<CR>
nmap <C-s> :w<CR>
noremap j gj
noremap k gk

function! ClearAll()
    let r = @/
    if r != ''
        " clear highlight
        let @/ = ''
    endif
    " must use double quotes
    call feedkeys("\<C-g>", "n")
endfunction

nmap <silent> <C-g> :call ClearAll()<CR>
nmap cd :call utils#cd()<CR>

" =====================
" copy & paste
" =====================
nnoremap Y "+y
xnoremap Y "+y
nnoremap P "+p
xnoremap P "+p
" paste to command mode
cnoremap <C-v> <C-r>+

" =====================
" window
" =====================
nnoremap zh <C-w><C-h>
nnoremap zj <C-w><C-j>
nnoremap zk <C-w><C-k>
nnoremap zl <C-w><C-l>

inoremap <C-j> <ESC><C-w><C-j>
inoremap <C-k> <ESC><C-w><C-k>
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
tnoremap <C-J> <C-W>j<C-W>_
tnoremap <C-K> <C-W>k<C-W>_

for i in range(10)
    exec printf("nmap <leader>w%i :%iwincmd w<CR>", i, i)
endfor

nnoremap <leader>wc :close<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" ===================
" Edit
" ===================
nnoremap < <<
nnoremap > >>

inoremap <C-n> <Down>
inoremap <C-p> <Up>

nnoremap <silent><M-k>  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent><M-j>  :<c-u>execute 'move +'. v:count1<cr>

inoremap <silent><M-j> <Esc>:m .+1<CR>==gi
inoremap <silent><M-k> <Esc>:m .-2<CR>==gi

vnoremap <silent><M-j> :m '>+1<CR>gv=gv
vnoremap <silent><M-k> :m '<-2<CR>gv=gv

nnoremap <silent><CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" ==================
" Terminal
" ==================

let g:terminal_key="<M-t>"
tnoremap <ESC> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
tnoremap <silent><C-D> <C-\><C-n>:q!<CR>

" ====================
" Open
" ====================

exec printf("nnoremap <leader>op :e %s<CR>", fnameescape($CORE_CONFIG.'/plugins.vim'))

" ====================
" QuickfixToggle
" ====================

function! QuickfixToggle()
    " 检查当前窗口是否已经是 quickfix
    if &buftype ==# 'quickfix'
        cclose
        return
    endif

    " 尝试在当前页面的所有窗口中寻找 quickfix
    let l:qf_winid = getqflist({'winid' : 1}).winid
    if l:qf_winid > 0
        " 如果找到了已打开的 quickfix 窗口，则跳转过去
        call win_gotoid(l:qf_winid)
    else
        " 如果没打开，则打开它
        copen
    endif
endfunction

nnoremap <silent> <F10> :call QuickfixToggle()<CR>

call DetectKeyMapRegister(g:navigator, "<leader>")
call DetectKeyMapRegister(g:navigator, "<C-w>")

nnoremap <leader>; :
nmap <silent><leader>q :call functions#bufQuit()<CR>
nmap <leader>fs :w!<CR>
nmap <leader>Q :qa!<CR>

let g:navigator["<leader>"][";"] = ["<key>:", "cmd"]
let g:navigator["<leader>"]["Q"] = [":qa!", "quit all"]
let g:navigator["<leader>"]["q"] = ["functions#bufQuit()", "quit"]

let g:navigator["<C-w>"] = {
            \ "h": ["<KEY><C-w><C-h>", "to left win"],
            \ "j": ["<KEY><C-w><C-j>", "to down win"],
            \ "k": ["<KEY><C-w><C-k>", "to up win"],
            \ "l": ["<KEY><C-w><C-l>", "to right win"],
            \ "0": [":only", "delete other win"],
            \ }

for i in range(1, 9)
    let g:navigator["<leader>"][i] = [":wincmd " . i, "goto win " . i]
endfor

nnoremap zh <C-w><C-h>
nnoremap zj <C-w><C-j>
nnoremap zk <C-w><C-k>
nnoremap zl <C-w><C-l>

" editor improve {{
" 全选
nnoremap <M-a> ggVG
" 折叠
nmap <Tab> za
" 连接下一行
nnoremap J gJ
" 减少缩进
nnoremap < <<
" 增加缩进
nnoremap > >>

" 当前行移动
nnoremap <silent><M-k>  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent><M-j>  :<c-u>execute 'move +'. v:count1<cr>

inoremap <silent><M-j> <Esc>:m .+1<CR>==gi
inoremap <silent><M-k> <Esc>:m .-2<CR>==gi

vnoremap <silent><M-j> :m '>+1<CR>gv=gv
vnoremap <silent><M-k> :m '<-2<CR>gv=gv

nnoremap <silent><CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" 系统复制粘贴
nnoremap Y "+y
xnoremap Y "+y
xnoremap P "+p
nnoremap P "+p

" 删除字在插入模式下
inoremap <silent> <expr> <M-Backspace> functions#Close_fcitx('<C-o>diw')

" real delete
nnoremap D "_d
nnoremap Dx "_x
xnoremap D "_d
" }}

" Terminal Function {{
let g:term_buf = 0
let g:term_win = 0
let s:prev_buf = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
        " 处理多出来的 buffer
        " 只有 term 和前一个 buf 不一样时执行
        if s:prev_buf != g:term_buf
            exec "bd " . s:prev_buf
        endif
    else
        botright new
        exec "resize " . a:height
        try
            let s:prev_buf = bufnr("")
            exec "buffer " . g:term_buf
            if !has('nvim')
                exec "normal i"
            endif
        catch
            if has('nvim')
                call termopen($SHELL, {"detach": 0})
            else
                call term_start($SHELL, { 'curwin': 1 })
            endif
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
" }}

" terminal {{
nnoremap <silent><M-t> :call TermToggle(12)<CR>
inoremap <silent><M-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><M-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <silent><M-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap :q! <C-\><C-n>:q!<CR>
" }}

" movtion {{
nnoremap <S-Up> k
nnoremap <S-Down> j
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap <Up> gk
noremap <Down> gj

" 窗口间移动
inoremap <C-j> <ESC><C-w><C-j>
inoremap <C-k> <ESC><C-w><C-k>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
tmap <C-J> <C-W>j<C-W>_
tmap <C-K> <C-W>k<C-W>_
" 字移动
imap <C-n> <Down>
imap <C-p> <Up>

" 向上新建一行
inoremap <S-CR> <C-o>O
" }}

" exec {{
nnoremap <silent> <C-x><C-c> :source %<CR>
vnoremap <silent> <C-x><C-c> :<C-u>for line in getline("'<", "'>") \| execute line \| endfor<CR>
" }}

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

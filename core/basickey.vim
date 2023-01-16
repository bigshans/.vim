" basic op {{
nnoremap <leader><leader> <esc>
nnoremap <leader>; :
nmap <silent><leader>q :call functions#bufQuit()<CR>
nmap <leader>fs :w!<CR>
nmap <leader>fS :W<CR>
nmap <leader>Q :qa!<CR>
" 上引号
" inoremap “ “”
inoremap ” “”<Left>
" 上引号
" inoremap ‘ ‘’
inoremap ’ ‘’<Left>

nnoremap <silent><leader><Up> :res -1<CR>
nnoremap <silent><leader><Down> :res +1<CR>
nnoremap <silent><leader><Left> :vertical res -1<CR>
nnoremap <silent><leader><Right> :vertical res +1<CR>

call whichkey#add("<Up>", "desc height")
call whichkey#add("<Down>", "asc height")
call whichkey#add("<Left>", "desc width")
call whichkey#add("<Right>", "asc width")

call whichkey#add("<space>", "cancel")
call whichkey#add(";", "command")
call whichkey#add("q", "quit buffer")
call whichkey#add("Q", "quit vim")
call whichkey#add("f.s", "save file")
call whichkey#add("f.S", "save file as sudo")
" }}

" window op {{
nnoremap <leader>wd :only<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>ws :vsplit<CR>

call whichkey#add("w.d", "delete other window")
call whichkey#add("w.h", "split window horizen")
call whichkey#add("w.s", "split window vertical")

for s:i in range(1, 9)
	execute 'nnoremap <leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
	call whichkey#add("" . s:i, "to windows " . s:i)
endfor

nnoremap zh <C-w><C-h>
nnoremap zj <C-w><C-j>
nnoremap zk <C-w><C-k>
nnoremap zl <C-w><C-l>
" }}

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
nnoremap <silent><A-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent><A-Down>  :<c-u>execute 'move +'. v:count1<cr>
inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
nnoremap <silent><CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent><leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[

call whichkey#add("<CR>", "insert new line in normal")

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
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
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
nnoremap <silent><A-t> :call TermToggle(12)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap :q! <C-\><C-n>:q!<CR>
" }}

" movtion {{
nnoremap <S-Up> k
nnoremap <S-Down> j
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

" 字移动
imap <C-n> <Down>
imap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" 词移动
inoremap <M-f> <C-Right>
inoremap <M-b> <C-Left>

" h行移动
inoremap <C-e> <End>
inoremap <C-a> <Esc>I
" }}

" exec {{
nnoremap <silent> <C-x><C-c> :source %<CR>
vnoremap <silent> <C-x><C-c> :<C-u>for line in getline("'<", "'>") \| execute line \| endfor<CR>
" }}

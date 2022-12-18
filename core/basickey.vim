nnoremap <leader><leader> <esc>
call whichkey#add("<space>", "cancel")
nnoremap <leader>; :
call whichkey#add(";", "command")

nmap <silent><leader>q :call functions#bufQuit()<CR>
call whichkey#add("q", "quit")

nmap <leader>fs :w!<CR>
call whichkey#add("f.s", "save file")
nmap <leader>fS :W<CR>
call whichkey#add("f.S", "save file as sudo")

nnoremap <leader>wd :only<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>ws :vsplit<CR>
nnoremap <leader>wo :only<CR>

nnoremap <C-a> ggVG
nmap <Tab> za
nnoremap J gJ
nnoremap gp `[v`]
nnoremap < <<
nnoremap > >>
inoremap <C-e> <End>
inoremap <C-a> <Esc>I
nnoremap <silent><C-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent><C-Down>  :<c-u>execute 'move +'. v:count1<cr>
inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
vnoremap <silent>gy :call functions#CompleteYank()<CR>

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
" For Terminal For Basic {{
nnoremap <silent><A-t> :call TermToggle(12)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap :q! <C-\><C-n>:q!<CR>
" }}
nnoremap <silent><leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
call whichkey#add("<CR>", "insert new line in normal")
nnoremap <silent><CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent><leader><Up> :res -1<CR>
call whichkey#add("<Up>", "desc height")
nnoremap <silent><leader><Down> :res +1<CR>
call whichkey#add("<Down>", "asc height")
nnoremap <silent><leader><Left> :vertical res -1<CR>
call whichkey#add("<Left>", "desc width")
nnoremap <silent><leader><Right> :vertical res +1<CR>
call whichkey#add("<Right>", "asc width")

inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
nnoremap <S-Up> k
nnoremap <S-Down> j
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj
" inoremap <silent> <expr> <Up> pumvisible() ? '<Up>' : functions#Close_fcitx('<C-o>gk')
" inoremap <silent> <expr> <Down> pumvisible() ? '<Down>' : functions#Close_fcitx('<C-o>gj')
inoremap <silent> <expr> <M-Backspace> functions#Close_fcitx('<C-o>diw')
nnoremap <leader>; :
nmap <leader>Q :qa!<CR>
nnoremap Y "+y
xnoremap Y "+y
xnoremap P "+p
nnoremap P "+p
nnoremap <silent><leader>y :<C-u>CocList -A --normal yank<CR>
call whichkey#add("y", "yank list")
nnoremap <silent> <C-x><C-c> :source %<CR>
vnoremap <silent> <C-x><C-c> :<C-u>for line in getline("'<", "'>") \| execute line \| endfor<CR>
" Emacs like keybindings {{
imap <C-n> <Down>
imap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-f> <C-Right>
inoremap <M-b> <C-Left>
" }}
" real delete
nnoremap D "_d
nnoremap Dx "_x
xnoremap D "_d

for s:i in range(1, 9)
	execute 'nnoremap <leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
	execute 'nnoremap z' . s:i . ' :' . s:i . 'wincmd w<CR>'
	call whichkey#add("" . s:i, "to windows " . s:i)
endfor

nnoremap zh <C-w><C-h>
nnoremap zj <C-w><C-j>
nnoremap zk <C-w><C-k>
nnoremap zl <C-w><C-l>

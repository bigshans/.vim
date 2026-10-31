scriptencoding utf-8
nnoremap <buffer> q :cclose<CR>
nnoremap <buffer> <Esc> :cclose<CR>
nnoremap <buffer> <CR> <CR>
" 回车跳转后回到代码窗口（保持 QF 开启，但光标跳回）
nnoremap <buffer> p <CR><C-w>p
setlocal colorcolumn=

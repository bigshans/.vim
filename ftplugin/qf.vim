map <buffer>q :q<CR>
map <buffer><esc> :q<CR>
noremap <buffer><CR> <CR>
setlocal colorcolumn=

" 只在 quickfix 窗口中生效的映射
nnoremap <buffer> q :cclose<CR>
nnoremap <buffer> <CR> <CR>
" 如果你想按回车跳转后自动回到代码窗口（保持 QF 开启但光标跳回）
nnoremap <buffer> p <CR><C-w>p

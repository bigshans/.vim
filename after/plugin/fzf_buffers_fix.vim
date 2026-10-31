" fzf.vim 用 remove(g:fzf#vim#buffers, expand('<abuf>')) 清理缓冲区记录。
" 当该缓冲区已被删除时，remove() 会抛 E716，而 silent! 在 Vim 9 下不能抑制
" 函数调用里的这个错误。这里用带 has_key 的版本覆盖它。
if exists('g:fzf#vim#buffers')
    augroup fzf_buffers
        autocmd!
        if exists('*reltimefloat')
            autocmd BufWinEnter,WinEnter * let g:fzf#vim#buffers[bufnr('')] = reltimefloat(reltime())
        else
            autocmd BufWinEnter,WinEnter * let g:fzf#vim#buffers[bufnr('')] = localtime()
        endif
        autocmd BufDelete * if has_key(g:fzf#vim#buffers, expand('<abuf>'))
                    \| call remove(g:fzf#vim#buffers, expand('<abuf>'))
                    \| endif
    augroup END
endif

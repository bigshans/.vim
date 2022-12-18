function! config#hugefile()
    let g:trigger_size = 1048576
	augroup hugefile
		autocmd!
		autocmd BufReadPre *
					\ let size = getfsize(expand(@%)) |
					\ if (size > g:trigger_size) || (size == -2) |
					\ setlocal nowrap |
					\ endif |
					\ unlet size
	augroup END
    " augroup hugefile
    "     autocmd!
    "     autocmd BufReadPre *
    "                 \ let size = getfsize(expand(@%)) |
    "                 \ if (size > g:trigger_size) || (size == -2) |
    "                 \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
    "                 \   let b:coc_enabled=0 |
    "                 \   let g:enable_spelunker_vim=0 |
    "                 \   exec 'RainbowParenthesesToggle' |
    "                 \ else |
    "                 \   let g:enable_spelunker_vim=1 |
    "                 \   exec 'RainbowParenthesesActivate' |
    "                 \ endif |
    "                 \ unlet size
    " augroup END
endfunction

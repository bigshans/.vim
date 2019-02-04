function! GetCodeBlock() "{{
    let l:regex = '^\(\s*\)#+BEGIN_\(\w*\)\s\w*\n\_.\{-}\1#+END_\2\n$\{-}'
    let l:posSaved = getpos('.')
    let l:curLine = l:posSaved[1]
    let l:beginLine = search(l:regex, 'bcW')
    let l:endLine = search(l:regex, 'cWe', l:beginLine)
    call setpos('.', l:posSaved)
    if !l:beginLine || !l:endLine 
        return
    elseif l:beginLine < l:curLine && l:endLine > l:curLine
        execute (l:beginLine + 1) . ',' . (l:endLine - 1) . 'NN'
    endif
endfunction "}}

au! FileType org nnoremap <buffer><silent><localleader>nn :call GetCodeBlock()<CR>

nnoremap <leader>os :source %<CR>

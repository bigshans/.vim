function utils#sudo_save() abort
    if exists(':SudaWrite')
        exe 'SudaWrite'
    elseif has('nvim')
        exe 'w !pkexec tee > /dev/null %' | setl nomod
    else
        exe 'w !sudo tee %' | setl nomod
    endif
endfunction

function utils#quit() abort
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
        execute 'bdelete!'
    else
        execute 'quit!'
    endif
endfunction

function! utils#cd()
    let s = fnamemodify(resolve(expand('%:p')), ':h')
    echo 'Now root is ' . s
    exec 'cd ' . s
endfunction

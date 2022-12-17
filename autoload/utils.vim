function utils#sudo_save() abort
    if has('nvim')
        if exists(':SudaWrite')
            exe 'SudaWrite'
        else
            exe 'w !pkexec tee > /dev/null %' | setl nomod
        endif
    else
        exe 'w !sudo tee > /dev/null $' | setl nomod
    endif
endfunction

function utils#toggle_readonly() abort
    if &ro
        set noro
    else
        set ro
    endif
endfunction

function utils#mk_dir() abort
    execute ':silent !mkdir -p %h'
endfunction

function utils#bigger() abort
    let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
endfunction

function utils#smaller() abort
    let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
endfunction

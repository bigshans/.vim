if !has('unix')
    if executable('pwsh')
        let g:floaterm_shell = 'pwsh'
    elseif executable('powershell')
        let g:floaterm_shell = 'powershell'
    else
        let g:floaterm_shell = &shell
    endif
endif

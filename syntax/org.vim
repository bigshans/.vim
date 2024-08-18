function! s:OrgModeHighlightSources()
    let filetypes = {}
    for line in getline(1, '$')
        let ft = matchstr(line, '\v\c\#\+BEGIN_SRC\s+\zs\S+\ze')
        if !empty(ft) && ft !~# '^\d*$'
            let final_ft = ft
            if ft == 'emacs-lisp'
                let final_ft = 'lisp'
            elseif ft == 'shell'
                let final_ft = 'bash'
            endif
            call SyntaxRange#Include('#+BEGIN_SRC '.ft, '#+END_SRC', final_ft, 'comment')
            call SyntaxRange#Include('#+begin_src '.ft, '#+end_src', final_ft, 'comment')
        endif
    endfor
endfunction

if exists('g:loaded_SyntaxRange')
    call s:OrgModeHighlightSources()
endif

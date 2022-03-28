" Helper functions for org.vim
"
" Maintainer:   Alex Vear <alex@vear.uk>
" License:      Vim (see `:help license`)
" Location:     autoload/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2020-01-04

" Fallback chain for options. Buffer local --> Global --> default.
function org#option(name, default) abort
    return get(b:, a:name, get(g:, a:name, a:default))
endfunction

" Emacs-like fold text.
function org#fold_text() abort
    return getline(v:foldstart) . '...'
endfunction

" Check fold depth of a line.
function! org#fold_expr(num) abort
    if !exists('b:org_total_line') || b:org_total_line == -1
        let b:org_total_line = len(getline(1, '$'))
    endif
    let l:line = getline(a:num)
    if !exists('b:org_outline')
        let b:org_outline = 0
    endif
    let l:begin_block = '^\s*#+BEGIN_\w*\s*\w*'
    let l:end_block = '^\s*#+END_\w*'
    if l:line =~ l:begin_block
        let b:block_type = split(split(l:line, ' ')[0], '_')[1]
        return '>' . (b:org_outline + 1)
    endif
    if l:line =~ l:end_block
        let l:block_type = split(split(l:line, ' ')[0], '_')[1]
        if exists('b:block_type') && l:block_type == b:block_type
            return '<' . (b:org_outline + 1)
        endif
    endif
    let l:titleRegex = '^\s*\*\+\s*.*$'
    if l:line =~ l:titleRegex
        let l:foldDepth = len(split(l:line, ' ')[0])
        let b:org_outline = l:foldDepth
        return '>' . l:foldDepth
    endif
    if b:org_total_line == a:num
        let b:org_total_line = -1
        return '<' . b:org_outline
    endif
    return '='
endfunction

function! org#indent_expr(num)
    if a:num == 1
        return 0
    endif
    let l:titleRegex = '^\s*\*\+\s*.*$'
    let l:current_line = getline(a:num)
    if l:current_line =~ l:titleRegex
        return 0
    endif
    let l:prev_line = getline(a:num - 1)
    let l:prev_indent = indent(a:num - 1)
    let l:cur_indent = indent(a:num)
    if l:cur_line =~ '^\s*$'
        return 0
    endif
    if l:prev_line =~ l:titleRegex
        let l:indent = len(split(l:prev_line, ' ')[0])
        return l:indent
    endif
    if l:current_line =~ '^\s*-\s' || l:current_line =~ '^\s*\*\s'
        return l:cur_indent
    endif
    let l:ln = a:num
    while l:ln != 0
        let l:ln = l:ln - 1
        if getline(l:ln) =~ '^\s*$'
            continue
        endif
        let l:prev_indent = indent(l:ln)
        return l:cur_indent > l:prev_indent ? l:cur_indent : l:prev_indent
    endwhile
    return l:prev_indent
endfunction


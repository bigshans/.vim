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

function org#fold_block(num)
    let l:regex = '^\(\s*\)#+BEGIN_\(\w*\)\s\w*\n\_.\{-}\1#+END_\2\n$\{-}'
    let l:pos = getpos('.')
    let l:movePos = l:pos
    let l:movePos[1] = a:num
    call setpos('.', l:movePos)
    let l:beginLine = search(l:regex, 'bcW')
    let l:endLine = search(l:regex, 'cWe', l:beginLine)
    call setpos('.', l:pos)
    if !l:beginLine || !l:endLine
        return 0
    endif
    if l:beginLine < a:num && l:endLine > a:num
        return 1
    endif
    if l:beginLine == a:num
        return 2
    endif
    if l:endLine == a:num
        return 3
    endif
    return 0
endfunction

" Check fold depth of a line.
function org#fold_expr(num)
    let l:pos = getpos('.')
    let l:block = org#fold_block(a:num)
    if l:block == 1
        call setpos('.', l:pos)
        return '='
    endif
    let l:titleRegex = '^\s*\*\+\s*.*$'
    let l:currentLine = getline(a:num)
    call setpos('.', l:pos)
    if l:currentLine =~ l:titleRegex
        let l:foldDepth = len(split(l:currentLine, ' ')[0])
        return '>' . l:foldDepth
    endif
    let l:movePos = l:pos
    let l:ori = l:pos[1]
    let l:movePos[1] = a:num
    call setpos('.', l:movePos)
    let l:pos[1] = l:ori
    let l:beginLine = search(l:titleRegex, 'bcW')
    let l:endLine = search(l:titleRegex, 'ceW', a:num)
    call setpos('.', l:pos)
    if !l:beginLine
        return l:block == 2 ? '>1' : 0
    endif
    let l:foldDepth = len(split(getline(l:beginLine), ' ')[0])
    call setpos('.', l:pos)
    if l:block == 2
        return '>' . (l:foldDepth + 1)
    endif
    if l:block == 3
        return '<' . (l:foldDepth + 1)
    endif
    python import vim
    let numlines=pyeval('len(vim.buffers['.({expr}-1).'])')
    if numlines == a:num
        return '<' . l:foldDepth
    endif
    return '='
endfunction

function! PrevNonBlank(line) 
	let line = prevnonblank(a:line)
	 
	if (len(synstack(line,1))>0) && (synIDattr(synstack(line,1)[0],'name') == 'orgLisp')
		execute line + 1
		let line = search('^#+begin_src','nb')-1
	elseif (len(synstack(line-1,1))>0) && (synIDattr(synstack(line-1,1)[0],'name') == 'orgList')
		execute line - 1
		let line = search('^\s*$','nb')-1

	endif
	return prevnonblank(line)
endfunction

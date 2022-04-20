"" ------------------------
"" --- custom functions ---
"" ------------------------

" yank text with line numbers and file name on top
function! functions#CompleteYank()
	redir @n | silent! :'<,'>number | redir END
	let filename=expand("%")
	let decoration=repeat('-', len(filename)+1)
	let @+=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunction

function! functions#get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" disable fcitx temp
fun! functions#Close_fcitx(icmd)
  let g:disable_fcitx_toggle_temp = 1
  return a:icmd
endf

" get buffer width
function! functions#BufferWidth() abort
  let view = winsaveview()
  let max_col = 0
  g/^/let max_col=max([max_col, col('$') - 1])
  call histdel('search', -1)
  let @/ = histget('search', -1)
  call winrestview(view)
  return max_col
endfunction

" trim white spaces
function! functions#TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction


" convert list of items to SQL tuple
function! functions#ToTupleFun() range
	silent execute a:firstline . ',' . a:lastline . 'norm I"'
	silent execute a:firstline . ',' . a:lastline . 'norm A",'
	silent execute a:firstline . ',' . a:lastline . 'join'

	" lines are now joined, there is only one line
	silent execute 'norm $x'
	silent execute 'norm I('
	silent execute 'norm A)'

	" yank final text
	silent execute 'norm yy'
endfunction


" T2S and S2T
function! functions#T2S ()
	set expandtab | %retab! | w
endfunction


function! functions#S2T ()
	set noexpandtab | %retab! | w
endfunction


" replace entire content of file
function! functions#ReplaceFile()
	silent execute 'norm gg"_dGP'
endfunction


" blink word under cursor
function! functions#BlinkWord(blinktime)
	let target_pat = '\c\%#'.@/
	let ring = matchadd('IncSearch', target_pat)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction

function! functions#ToggleQF() abort
	for i in range(1, winnr('$'))
        if getbufvar(winbufnr(i), '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

	if getqflist() == []
		echo "qf list empty"
		return
	endif
	copen
endfunction

function! functions#ToggleLL() abort
	for i in range(1, winnr('$'))
        if getbufvar(winbufnr(i), '&buftype') == 'quickfix'
            lclose
            return
        endif
    endfor

	if getloclist(0) == []
		echo "loc list empty"
		return
	endif
	lopen
endfunction

function! functions#bufQuit() abort
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
        execute 'bdelete'
    else
        execute 'quit'
    endif
endfunction

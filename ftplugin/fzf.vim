" tunmap <buffer> <Esc>
tnoremap <buffer><silent> <Esc> <c-\><c-n>:call OnExitFZF()<CR>

function! OnExitFZF()
    call timer_start(200, { -> CallFzfCancelCb(v:true) })
    call feedkeys("i\<Esc>", "n")
endfunction

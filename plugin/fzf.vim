let s:fzfCancelCb = []

function! RegisterFzfCancelCb(cb)
    call add(s:fzfCancelCb, a:cb)
endfunction

function! CallFzfCancelCb(isCancel)
    let l:cbs = s:fzfCancelCb
    let s:fzfCancelCb = []
    for l:Fn in l:cbs
        if type(l:Fn) == v:t_func
            call l:Fn(a:isCancel)
        endif
    endfor
endfunction

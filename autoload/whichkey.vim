if exists("g:which_key_map") == 0
    let g:which_key_map = {}
endif

function whichkey#add(...) abort
    if a:0 == 1
        let l:keymap = a:0
    else
        let l:keymap = { "key": a:1, "desc": a:2 }
    endif
    let keys = l:keymap["key"]
    let pre_keys = split(keys, '\.')
    let l:cur = g:which_key_map
    let pk_len = len(pre_keys)
    let i = 0
    for pre in pre_keys
        if !has_key(l:cur, pre)
            if i == pk_len - 1
                let l:cur[pre] = l:keymap["desc"]
            else
                let l:cur[pre] = {}
                let l:cur = l:cur[pre]
            endif
        else
            let l:cur = l:cur[pre]
        endif
        let i += 1
    endfor
endfunction

function whichkey#end() abort
    call which_key#register("<Space>", 'g:which_key_map')
endfunction

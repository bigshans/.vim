function! s:JiebaMapKeys()
    if exists("b:jieba_enabled")
        return
    endif
    let b:jieba_enabled = 1

    let keys = ["b", "B", "ge", "gE", "w", "W", "e", "E",]
    let modes = ["n", "o", "v",]
    for ky in keys
        execute 'nmap <buffer> ,j' . ky . ' <Plug>(Jieba_preview_' . ky . ')'
        for md in modes
            execute md . 'map <buffer> ' . ky . ' <Plug>(Jieba_' . ky . ')'
        endfor
    endfor
endfunction

function! s:JiebaUnmapKeys()
    if exists("b:jieba_enabled")
        unlet b:jieba_enabled
    else
        return
    endif

    let keys = ["b", "B", "ge", "gE", "w", "W", "e", "E",]
    let modes = ["n", "o", "v",]
    for ky in keys
        execute 'silent! nunmap <buffer> ,j' . ky
        for md in modes
            execute 'silent! ' . md . 'unmap <buffer> ' . ky
        endfor
    endfor
endfunction

function! s:JiebaToggle()
    if exists("b:jieba_enabled")
        call s:JiebaUnmapKeys()
    else
        call s:JiebaMapKeys()
    endif
endfunction

command! JiebaEnable call s:JiebaMapKeys()
command! JiebaDisable call s:JiebaUnmapKeys()
command! JiebaToggle call s:JiebaToggle()

nnoremap ,, :<C-u>JiebaToggle<CR>

let g:goyo_width = 85

function! s:goyo_enter()
    let s:old_theme = g:colors_name
endfunction

function! s:goyo_leave()
    call SetTheme(s:old_theme)
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

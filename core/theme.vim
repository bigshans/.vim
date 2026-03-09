function! SetTheme(theme) abort
    try
        execute 'colorscheme ' . a:theme
    catch /^Vim\%((\a\+)\)\=:E185/
        echohl ErrorMsg | echo "未找到主题: " . a:theme | echohl None
        return
    endtry

    highlight Directory ctermfg=11 guifg=#89B4FA

    if has("gui_running") && has("win32")
        set renderoptions=type:directx
    endif
endfunction

" 初始调用
call SetTheme('onedark')

function! SetTheme(theme) abort
    try
        execute 'colorscheme ' . a:theme
    catch /^Vim\%((\a\+)\)\=:E185/
        echohl ErrorMsg | echo "未找到主题: " . a:theme | echohl None
        return
    endtry

    highlight Normal guibg=#21252b guifg=#abb2bf

    highlight LineNr guifg=#4b5263 guibg=#21252b

    highlight! clear CursorLineNr
    highlight CursorLineNr guifg=#e5c07b guibg=#2c323c gui=bold cterm=bold
    highlight CursorLine guibg=#2c323c gui=NONE cterm=NONE


    highlight Keyword guifg=#c678dd gui=italic
    highlight String guifg=#98c379
    
    highlight Pmenu guibg=#282c34 guifg=#abb2bf
    highlight PmenuSel guibg=#3e4452 guifg=#61afef gui=bold

    highlight Directory ctermfg=11 guifg=#89B4FA

    if has("gui_running") && has("win32")
        set renderoptions=type:directx
    endif
endfunction

" 初始调用
call SetTheme('dracula')

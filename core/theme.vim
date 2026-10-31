function! SetTheme(theme) abort
    try
        execute 'colorscheme ' . a:theme
    catch /^Vim\%((\a\+)\)\=:E185/
        echohl ErrorMsg | echo "未找到主题: " . a:theme | echohl None
        return
    endtry

    " inkstone 等自带完整配色的主题不再叠加这些覆盖色
    if a:theme !~# '^inkstone'
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
    endif

    if has("gui_running") && has("win32")
        set renderoptions=type:directx
    endif
endfunction

" vim-airline 主题（插件自带的 inkstone airline 主题，随配色自动切换）
let g:airline_theme = 'inkstone'

" 默认变体：宣纸 xuanzhi（浅色）。可选：xuanmo / xuanmo-dimmed / canghai /
" xuanzhi / xuanzhi-dimmed / qingci；运行时用 :Inkstone <变体> 临时切换
let g:inkstone_variant = 'canghai'

" 初始调用（可改成 catppuccin_mocha / sonokai / dracula 等）
call SetTheme('inkstone')

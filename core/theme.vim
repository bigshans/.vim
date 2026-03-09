function! SetTheme(theme) abort
    try
        execute 'colorscheme ' . a:theme
    catch /^Vim\%((\a\+)\)\=:E185/
        echohl ErrorMsg | echo "未找到主题: " . a:theme | echohl None
        return
    endtry

    " ========================
    " Coc / Pmenu 补全窗口美化
    " ========================

    " 1. 补全菜单默认样式 (未选中)
    highlight Pmenu guibg=#2C323C guifg=#ABB2BF

    " 2. 选中项的样式 (关键：设置一个明显的背景色，如浅蓝色或紫色)
    " guibg: 背景色  guifg: 文字颜色  gui=bold: 加粗
    highlight PmenuSel guibg=#3E4452 guifg=#61AFEF gui=bold

    " 3. 滚动条和边框
    highlight PmenuSbar guibg=#2C323C
    highlight PmenuThumb guibg=#4B5263

    " 4. 针对 Coc 的浮动诊断窗口 (你之前列出的那部分)
    highlight CocFloating guibg=#282C34
    highlight CocFloatBorder guifg=#61AFEF

    highlight Directory ctermfg=11 guifg=#89B4FA

    if has("gui_running") && has("win32")
        set renderoptions=type:directx
    endif
endfunction

" 初始调用
call SetTheme('onedark')

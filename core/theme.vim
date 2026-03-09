function! SetTheme(theme) abort
    execute 'colorscheme ' . a:theme

    " ========================
    " Highlight
    " ========================

    highlight Directory ctermfg=11 guifg=#89B4FA
endfunction

call SetTheme('onedark')

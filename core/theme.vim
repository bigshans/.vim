function! SetTheme() abort
    colorscheme dracula

    " ========================
    " Highlight
    " ========================

    highlight Directory ctermfg=11 guifg=#89B4FA
endfunction

call SetTheme()

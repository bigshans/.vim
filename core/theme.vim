function s:setTheme(theme)
    exec "colorscheme " .. a:theme
    let g:airline_theme = a:theme
    if a:theme ==# 'catppuccin_macchiato'
        highlight CocFloating guibg=#1e2030 guifg=#c7d3f5
    else
        highlight CocFloating guibg=#222436 guifg=#c7d3f5
    endif
    highlight CocFloatingActive guibg=#363c58 guifg=#c7d3f5
endfunction
call s:setTheme('catppuccin_macchiato')

function s:setTheme(theme)
    exec "colorscheme " .. a:theme
    let g:airline_theme = a:theme
endfunction
call s:setTheme('catppuccin_mocha')

highlight CocFloating guibg=#222436 guifg=#c7d3f5
" highlight CocFloating guibg=#1e2030 guifg=#c7d3f5
highlight CocFloatingActive guibg=#363c58 guifg=#c7d3f5

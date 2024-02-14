call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].z = {
            \ 'name': 'fold...',
            \ 'c': ['<key>za', 'toggle current fold'],
            \ 'a': ['<key>zM', 'close all fold'],
            \ 'o': ['<key>zR', 'open all fold']
            \}

" {{ fold key
    nmap <leader>zc za
    nmap <leader>za zM
    nmap <leader>zo zR
"

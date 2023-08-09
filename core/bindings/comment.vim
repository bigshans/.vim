call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].c = {
            \ "name": "comment",
            \ "i": ["<plug>NERDCommenterToggle", "comment code"],
            \ "f": ["<plug>NERDCommenterComment", "comment partial"],
            \ }

nmap <leader>ci <plug>NERDCommenterToggle
vmap <leader>ci <plug>NERDCommenterToggle

nmap <leader>cf <plug>NERDCommenterComment
vmap <leader>cf <plug>NERDCommenterComment

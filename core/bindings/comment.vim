let g:navigator["<leader>"].c = {
            \ "name": "comment",
            \ "i": [":TComment", "comment code"],
            \ }

nmap <silent> <leader>ci :TComment<CR>
vmap <silent> <leader>ci :TComment<CR>

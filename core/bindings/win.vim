let g:navigator["<C-w>"] = {
            \ "name": "windows",
            \ "h": ["<KEY><C-w><C-h>", "to left win"],
            \ "j": ["<KEY><C-w><C-j>", "to down win"],
            \ "k": ["<KEY><C-w><C-k>", "to up win"],
            \ "l": ["<KEY><C-w><C-l>", "to right win"],
            \ "0": [":only", "delete other win"],
            \ "c": [":ChooseWin", "goto"],
            \ "<C-s>": [":ChooseWinSwap", "swap win"]
            \ }

nnoremap <C-w>c :ChooseWin<CR>
nnoremap <C-w><C-s> :ChooseWinSwap<CR>

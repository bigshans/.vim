call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].w = {
            \ "name": "windows",
            \ "0": [":ChooseWin", "goto"],
            \ "c": [":ChooseWinSwap", "swap win"],
            \ }

nnoremap <leader>w0 :ChooseWin<CR>
nnoremap <leader>wc :ChooseWinSwap<CR>

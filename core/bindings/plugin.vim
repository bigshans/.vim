call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].P = {
            \ "name": "plugin",
            \ "i": [":PlugInstall", "install"],
            \ "c": [":PlugClean", "clean"],
            \ "p": [":PlugUpdate", "update"],
            \ "u": [":PlugUpgrade", "upgrade vim-plug"],
            \ }

nnoremap <leader>Pi  :PlugInstall<CR>
nnoremap <leader>Pc  :PlugClean<CR>
nnoremap <leader>Pp  :PlugUpdate<CR>
nnoremap <leader>Pu  :PlugUpgrade<CR>

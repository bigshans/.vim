" mode: search
call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator['<leader>'].s = {
            \ 'name': "search...",
            \ 's': [':Leaderf line', 'search lines'],
            \ 'b': [':Leaderf buffer', 'search buffers'],
            \ 'h': ['Leaderf help', 'search helptags'],
            \ 'r': ['Leaderf rg', 'search by rg']
            \ }


nnoremap <leader>sr :Leaderf rg<CR>
nnoremap <leader>ss :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>sh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>

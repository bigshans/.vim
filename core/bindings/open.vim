" mode: open
call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].o = {
            \ 'name': "open the file...",
            \ 'p': [":e $HOME/.vim/core/plugin.vim", "open plugin.vim"],
            \ 'C': [":CocConfig", "open coc-setting.json"],
            \ 'c': ["Leaderf file ~/.vim/core", "open core dir"]
            \ }

nnoremap <leader>op :e $HOME/.vim/core/plugin.vim<CR>
nnoremap <leader>oC :e $HOME/.vim/coc-settings.json<CR>
nnoremap <leader>oc :<C-U><C-R>=printf("Leaderf file %s", "~/.vim/core")<CR><CR>

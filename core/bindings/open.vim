let g:navigator["<leader>"].o = {
            \ 'name': "open the file...",
            \ 'p': [":e $HOME/.vim/core/plugin.vim", "open plugin.vim"],
            \ 'C': [":CocConfig", "open coc-setting.json"],
            \ 'c': [":Leaderf file ~/.vim/core", "open core dir"]
            \ }

if has('win32') || has('win64')
    nnoremap <leader>op :e $HOME/vimfiles/core/plugin.vim<CR>
    nnoremap <leader>oC :CocConfig<CR>
    nnoremap <leader>oc :Leaderf file ~/vimfiles/core<CR>
    let g:navigator["<leader>"].o.c[0]= ":LeaderfFile ~/vimfiles/core"
    let g:navigator["<leader>"].o.p[0]= ":e $HOME/vimfiles/core/plugin.vim"
else
    nnoremap <leader>op :e $HOME/.vim/core/plugin.vim<CR>
    nnoremap <leader>oC :e $HOME/.vim/coc-settings.json<CR>
    nnoremap <leader>oc :<C-U><C-R>=printf("Leaderf file %s", "~/.vim/core")<CR><CR>
endif

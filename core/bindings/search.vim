let g:navigator['<leader>'].s = {
            \ 'name': "[S]earch...",
            \ 'l': [':Leaderf line', '[S]earch [L]ines'],
            \ 'b': [':Leaderf buffer', '[S]earch [B]uffers'],
            \ 'h': ['Leaderf help', '[S]earch [H]elptags'],
            \ 'r': ['Leaderf rg', '[S]earch by [R]g'],
            \ 'd': [':LeaderfFile', '[S]earch [D]ir file'],
            \ 'p': [':ProjectList', '[S]earch [P]rojects'],
            \ 'w': [':VimwikiUISelect', 'search vimwiki'],
            \ }

nnoremap <silent><plug>LeaderfCurFolderFile :<C-U><C-R>=printf("Leaderf file %s", expand('%:p:h'))<CR><CR>

nnoremap <leader>sr :Leaderf rg<CR>
nnoremap <leader>sl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>ss :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>sh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>
nnoremap <leader>sd :LeaderfFile<CR>
nnoremap <leader>sp :ProjectList<CR>
nnoremap <leader>sw <Plug>VimwikiUISelect

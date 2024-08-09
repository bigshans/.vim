let g:navigator['<leader>'].s = {
            \ 'name': "search...",
            \ 'l': [':Leaderf line', 'search lines'],
            \ 'b': [':Leaderf buffer', 'search buffers'],
            \ 'h': ['Leaderf help', 'search helptags'],
            \ 'r': ['Leaderf rg', 'search by rg'],
            \ 'd': [':LeaderfFile', 'search current folder'],
            \ 'p': [":ProjectList", 'open project list'],
            \ }

nnoremap <silent><plug>LeaderfCurFolderFile :<C-U><C-R>=printf("Leaderf file %s", expand('%:p:h'))<CR><CR>

nnoremap <leader>sr :Leaderf rg<CR>
nnoremap <leader>sl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>ss :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>sh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>
nnoremap <leader>sd :LeaderfFile<CR>
nnoremap <leader>sp :ProjectList<CR>

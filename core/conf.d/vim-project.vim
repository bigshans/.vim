nn <leader>pa :AddCurrentProject<CR>
nn <leader>ps :SaveSession 
nn <leader>po :OpenSession<CR>
nn <leader>pd :DeleteSession<CR>
nn <leader>pc :CloseSession<CR>
command! AddCurrentProject exec 'Project ' . getcwd()

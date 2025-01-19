let g:navigator["<leader>"].p = {
    \ 'name': 'Project',
    \ 'a': [':AddCurrentProject', 'add current path into projects'],
    \ 's': ['<KEY>:SaveSession ', 'save session'],
    \ 'o': [':OpenSession <CR>', 'open session'],
    \ 'd': [':DeleteSession', 'delete session'],
    \ 'c': [':CloseSession', 'close session'],
  \ }

nn <leader>pa :AddCurrentProject<CR>
nn <leader>ps :SaveSession 
nn <leader>po :OpenSession<CR>
nn <leader>pd :DeleteSession<CR>
nn <leader>pc :CloseSession<CR>

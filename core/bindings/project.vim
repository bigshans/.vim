let g:navigator["<leader>"].p = {
    \ 'name': 'Project',
    \ 'a': [':AddCurrentProject', 'add current path into projects'],
  \ }

nn <leader>pa :AddCurrentProject<CR>

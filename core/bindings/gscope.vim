let g:navigator['<leader>'].G = {
    \ 's': ['<KEY>:GscopeFind s <C-R><C-W><cr>','find reference'],
    \ 'g': ['<KEY>:GscopeFind g <C-R><C-W><cr>','find symbol definition'],
    \ 'c': ['<KEY>:GscopeFind c <C-R><C-W><cr>','find caller'],
    \ 't': ['<KEY>:GscopeFind t <C-R><C-W><cr>','find text string'],
    \ 'e': ['<KEY>:GscopeFind e <C-R><C-W><cr>','find egrep pattern'],
    \ 'f': ['<KEY>:GscopeFind f <C-R>=expand("<cfile>")<cr><cr>','find file name'],
    \ 'i': ['<KEY>:GscopeFind i <C-R>=expand("<cfile>")<cr><cr>','find include file'],
    \ 'd': ['<KEY>:GscopeFind d <C-R><C-W><cr>','find callee'],
    \ 'a': ['<KEY>:GscopeFind a <C-R><C-W><cr>','find current symbol assigned'],
    \ 'z': ['<KEY>:GscopeFind z <C-R><C-W><cr>','find in ctags'],
  \ }

noremap <silent> <leader>Gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>Gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>Gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>Gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>Ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>Gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>Gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>Gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>Ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>Gz :GscopeFind z <C-R><C-W><cr>

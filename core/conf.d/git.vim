nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gps :Git! push<CR>
nnoremap <leader>gpl :Git! pull<CR>
nnoremap <leader>gx :GitGutterToggle<CR>
nnoremap <leader>gw :Gwrite<CR>

augroup AU_GIT
    autocmd!
    autocmd FileType git,fugitiveblame nmap <buffer><silent>q :q<CR>
    autocmd FileType fugitive nmap <buffer><silent>q :q<CR>
augroup END

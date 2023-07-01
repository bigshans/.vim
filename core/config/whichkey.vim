" whcih key
let g:which_key_sep = '➧ '
let g:which_key_timeout=200
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> [      :<c-u>WhichKey '['<CR>
nnoremap <silent> ]      :<c-u>WhichKey ']'<CR>
let g:which_key_map = {}
let g:which_key_hspace=4
autocmd! FileType which_key
autocmd  FileType which_key set noshowmode noruler
            \| autocmd BufLeave <buffer> set showmode ruler

" mode: file
call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].f = {
            \ 'name': "file...",
            \ 'r': ["Leaderf mru", "recently file list"],
            \ 'f': ["Leaderf file", "find files"],
            \ 't': [":CocCommand explorer --preset", "explorer"],
            \ 'c': [":Ranger", "ranger"],
            \ 's': [":w!", "write file"],
            \ 'S': [":SudaWrite", "write file as sudo"],
            \ 'm': ["::call mkdir(expand('%:p:h'), 'p')", 'mk dir']
            \ }

nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
nnoremap <silent><leader>ft :CocCommand explorer --preset<CR>
nnoremap <silent><leader>fc :Ranger<CR>
nnoremap <leader>fs :w!<CR>
nnoremap <leader>fS :SudaWrite<CR>
nnoremap <leader>fm :call mkdir(expand("%:p:h"), "p")<CR>

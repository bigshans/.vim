let g:navigator["<leader>"].f = {
            \ 'name': "file...",
            \ 'r': ["Leaderf mru", "recently file list"],
            \ 'f': ["Leaderf file", "find files"],
            \ 't': [":CocCommand explorer --toggle --sources=buffer-,file+ --preset", "explorer"],
            \ 'c': [":Ranger", "ranger"],
            \ 's': [":w!", "write file"],
            \ 'S': [":SudaWrite", "write file as sudo"],
            \ 'm': [":call mkdir(expand('%:p:h'), 'p')", 'mk dir'],
            \ }

if has('win32') || has('win64')
    nnoremap <silent><leader>fc :Lexplore<CR>
    let g:navigator["<leader>"].f['c'] = [':Lexplore', 'toggle expolre']
else
    nnoremap <silent><leader>fc :Ranger<CR>
endif

nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
nnoremap <silent><leader>ft :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>
nnoremap <leader>fs :w!<CR>
nnoremap <leader>fS :SudaWrite<CR>
nnoremap <leader>fm :call mkdir(expand("%:p:h"), "p")<CR>
nnoremap <leader>ft :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>

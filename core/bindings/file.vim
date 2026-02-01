let g:navigator["<leader>"].f = {
            \ 'name': "file...",
            \ 'r': ["Leaderf mru", "recently file list"],
            \ 'f': ["Leaderf file", "find files"],
            \ 't': [":CocCommand explorer --toggle --sources=buffer-,file+ --preset", "explorer"],
            \ 'c': [":Ranger", "ranger"],
            \ 's': [":w!", "write file"],
            \ 'S': [":SudaWrite", "write file as sudo"],
            \ 'm': ["::call mkdir(expand('%:p:h'), 'p')", 'mk dir']
            \ }

nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
nnoremap <silent><leader>ft :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>
nnoremap <silent>\ :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>
" if has('gui')
    nnoremap <silent><leader>fc :Lexplore<CR>
    let g:navigator["<leader>"]["c"] = [":Lexplore", "explore"]
" else
"     nnoremap <silent><leader>fc :Ranger<CR>
" endif
nnoremap <leader>fs :w!<CR>
nnoremap <leader>fS :SudaWrite<CR>
nnoremap <leader>fm :call mkdir(expand("%:p:h"), "p")<CR>

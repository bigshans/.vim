call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].g = {
            \ "name": "git...",
            \ "a": [":Git add .", "add all"],
            \ "b": [":Git blame", "blame"],
            \ "c": [":Git commit", "commit"],
            \ "d": [":Gvdiffsplit", "diff current file"],
            \ "r": [":Gread", "restore file"],
            \ "g": [":Git", "git"],
            \ "p": {
                \ "name": "push or pull..",
                \ "s": [":Git! push", "push"],
                \ "l": [":Git! pull", "pull"],
            \ },
            \ "x": [":GitGutterToggle", "highlight diff"],
            \ "w": [":Gwrite", "store file"],
            \ }

let g:_navigator_fugitive = { "prefix": "<leader>" }
let g:_navigator_fugitive["p"] = { 
            \ "P": [":Git push", "push"],
            \ "p": [":Git pull", "pull"],
            \ "c": ["<key>cc", "commit"],
            \ "<Space>": ["<key>a", "all"],
            \ }

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
    autocmd FileType git nmap <buffer><silent>q :q<CR>
    autocmd FileType fugitive nmap <buffer><silent>q :q<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>p :Git pull<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>P :Git push<CR>
    autocmd FileType fugitive nmap <buffer><leader>c cc
    autocmd FileType fugitive nmap <buffer><leader><leader> a
    autocmd FileType fugitive let b:navigator = MakeLocal(g:navigator["<leader>"], g:_navigator_fugitive)
    autocmd FileType fugitive nmap <buffer><leader> :Navigator b:navigator<CR>
augroup END

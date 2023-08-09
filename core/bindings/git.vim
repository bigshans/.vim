call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].g = {
            \ "name": "git...",
            \ "a": [":Git add %", "add"],
            \ "c": [":Git commit", "commit"],
            \ "r": [":Git store %", "restore"],
            \ "g": [":Git", "git"],
            \ "P": [":Git push", "push"],
            \ "p": [":Git pull", "pull"],
            \ "h": [":GitGutterToggle", "highlight diff"]
            \ }

let g:_navigator_fugitive = { "prefix": "<leader>" }
let g:_navigator_fugitive["p"] = { 
            \ "P": [":Git push", "push"],
            \ "p": [":Git pull", "pull"],
            \ "c": ["<key>cc", "commit"],
            \ "<Space>": ["<key>a", "all"],
            \ }

nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gr :Git restore %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gh :GitGutterToggle<CR>

augroup AU_GIT
    autocmd!
    autocmd FileType fugitive nmap <buffer><silent>q :q<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>p :Git pull<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>P :Git push<CR>
    autocmd FileType fugitive nmap <buffer><leader>c cc
    autocmd FileType fugitive nmap <buffer><leader><leader> a
    autocmd FileType fugitive let b:navigator = MakeLocal(g:navigator["<leader>"], g:_navigator_fugitive)
    autocmd FileType fugitive nmap <buffer><leader> :Navigator b:navigator<CR>
augroup END

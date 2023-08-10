vmap <buffer> <C-b> sa*gvllsa*
nmap <buffer> <C-b> viwsa*gvllsa*

vmap <buffer> <C-i> sa*
nmap <buffer> <C-i> viwsa*

vmap <buffer> <C-d> sa~gvllsa~
vmap <buffer> <C-u> satu<CR>

vmap <buffer> <C-`> sa`
nmap <buffer> <C-`> viwsa`

vmap <buffer> <C-l> sa[f]a(
vmap <buffer> <M-l> sa(F(i[

nmap <buffer> <tab> za

setlocal colorcolumn=

let g:_navigator_markdown = {'prefix': '<leader>' }

let g:_navigator_markdown["m"] = {
            \ 'name': 'markdown...',
            \ 't': {
            \ 'name': 'table...',
            \ '=': [':TableFormat', 'table format']
            \ }
            \ }
nmap <buffer><silent><leader>mt= :Tabularize<CR>
let b:navigator = MakeLocal(g:navigator["<leader>"], g:_navigator_markdown)
nmap <buffer><leader> :Navigator b:navigator<CR>

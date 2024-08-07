let g:navigator["<leader>"].t = {
            \ "name": "termainl...",
            \ "r" :[':FloatermNew ranger', 'launch ranger'],
            \ "t" :[":FloatermToggle", "toggle floaterm"],
            \ }

nmap <leader>tr :FloatermNew ranger<CR>
nmap <leader>tt :FloatermToggle<CR>

let g:terminal_shell='pwsh'

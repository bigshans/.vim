let g:navigator["<leader>"].t = {
            \ "name": "[T]erminal...",
            \ "r" :[':FloatermNew ranger', '[T]erminal [R]anger'],
            \ "t" :[":FloatermToggle", "[T]oggle Floa[t]erm"],
            \ "n" :[":FloatermNew", "[T]erminal [N]ew"],
            \ }

nmap <leader>tr :FloatermNew ranger<CR>
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tn :FloatermNew<CR>
if !has('unix')
	let g:terminal_shell='pwsh'
endif

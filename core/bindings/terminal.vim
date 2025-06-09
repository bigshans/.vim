let g:navigator["<leader>"].t = {
            \ "name": "[T]erminal...",
            \ "r" :[':FloatermNew ranger', '[T]erminal [R]anger'],
            \ "f" :[':Lf', '[T]erminal [l]f'],
            \ "t" :[":ProjectRootExe FloatermToggle", "[T]oggle Floa[t]erm"],
            \ "n" :[":ProjectRootExe FloatermNew", "[T]erminal [N]ew"],
            \ }

nmap <leader>tr :FloatermNew ranger<CR>
nmap <leader>tf :Lf<CR>
nmap <leader>tt :ProjectRootExe FloatermToggle<CR>
nmap <leader>tn :ProjectRootExe FloatermNew<CR>
command! RootFloatterm :ProjectRootExe FloatermNew
if !has('unix')
	let g:terminal_shell='pwsh'
endif

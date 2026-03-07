nmap <leader>sp :ProjectList<CR>
command! AddCurrentProject exec 'Project ' . getcwd()

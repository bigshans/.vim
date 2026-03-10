let g:asynctasks_extra_config = [
            \ utils#stdpath($HOME_VIM.'/tasks.ini'),
            \ ]

let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', 'node_modules', 'package.json']

nmap <leader>af :AsyncTask float-shell<CR>

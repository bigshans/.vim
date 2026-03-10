let g:asynctasks_extra_config = [
            \ utils#stdpath($HOME_VIM.'/tasks.ini'),
            \ ]

nmap <leader>af :AsyncTask float-shell<CR>

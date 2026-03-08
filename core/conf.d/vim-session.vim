nn <leader>pa :AddCurrentProject<CR>
nn <leader>ps :SaveSession 
nn <leader>po :OpenSession<CR>
nn <leader>sp :OpenSession<CR>
nn <leader>pd :DeleteSession<CR>
nn <leader>pc :CloseSession<CR>

let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = fnameescape($HOME_VIM.'/sessions')
let g:session_lock_enabled = 0

scriptencoding utf-8
let g:startify_session_dir = $HOME_VIM . '/sessions'
augroup startify_ft
    autocmd!
    autocmd User StartifyDataFetched silent! doautocmd FileType
augroup END

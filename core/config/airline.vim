let g:ale_airline#extensions#ale#enabled = 1
let g:ale_airline#extensions#coc#enabled = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {}

for index in range(10)
    let g:airline#extensions#tabline#buffer_idx_format[index] = index . ' '
endfor

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', ' ❖ %{tabpagewinnr(tabpagenr())} ')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

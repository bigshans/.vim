let g:navigator_leader = { 'prefix': '<leader>' }
let g:navigator_leader_visual = { 'prefix': '<leader>' }
let g:navigator_comma = { 'prefix': ',' }

" search {{

let g:navigator_leader.s = {
            \ 'name': "search...",
            \ 'l': [':Leaderf line', 'search lines'],
            \ 'b': [':Leaderf b', 'search buffers'],
            \ 'h': ['Leaderf help', 'search helptags'],
            \ }

" }}

" open private config {{

let g:navigator_leader.o = {
            \ 'name': "open the file...",
            \ 'p': [":e $HOME/.vim/core/plugin.vim", "open plugin.vim"],
            \ 'C': [":CocSetting", "open coc-setting.json"],
            \ 'c': ["Leaderf file ~/.vim/core", "open core dir"]
            \ }

" }}

" file {{

let g:navigator_leader.f = {
            \ 'name': "file...",
            \ 'r': ["Leaderf mru", "recently file list"],
            \ 'f': ["Leaderf file", "find files"],
            \ 't': [":CocCommand explorer --preset", "explorer"],
            \ }

" }}

" coc {{

let g:navigator_leader.j = {
            \ 'name': "coc...",
            \ 'a': ['<Plug>(coc-codeaction)', 'code action'],
            \ 'c': ['<Plug>(coc-diagnostic-info)', 'current position diagnostic'],
            \ 'r':  ['<Plug>(coc-rename)', 'rename'],
            \ 'f': ['<Plug>(coc-fix-current)', 'auto fix current'],
            \ 'd': [':CocList diagnostic', 'show diagnostic list'],
            \ 'l': ['<plug>(coc-codelens-action)', 'codelens-action'],
            \ }

" }}

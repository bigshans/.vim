let g:fern#renderer = "nerdfont"

let g:fern#default_hidden = 1
let g:fern#drawer_width = 30
let g:fern#disable_default_mappings = 1

nnoremap <silent> <leader>e :Fern . -drawer -toggle -width=30<CR>
autocmd BufEnter * silent! call fern#reveal(expand('%:p'))

function! s:init_fern() abort
  " Perform 'open' on leaf node and 'enter' on branch node
  nmap <buffer><expr>
            \ <Plug>(fern-my-open-or-enter)
            \ fern#smart#leaf(
            \   "<Plug>(fern-action-open)",
            \   "<Plug>(fern-action-enter)",
            \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-or-enter)
  nmap <buffer> <BS> <Plug>(fern-action-leave)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-expand)
  nmap <buffer> l <Plug>(fern-action-open-or-expand)
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> E <Plug>(fern-action-open:vsplit)
  nmap <buffer> e <Plug>(fern-action-open:split)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> i <Plug>(fern-action-preview)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> a <Plug>(fern-action-new-file)
  nmap <buffer> A <Plug>(fern-action-new-dir)
  nmap <buffer> m <Plug>(fern-action-choice)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> f <Plug>(fern-action-include)
  nmap <buffer> c <Plug>(fern-action-lcd)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> . <Plug>(fern-action-hidden:toggle)
  nmap <buffer> q :<C-u>quit<CR>
endfunction

autocmd FileType fern call s:init_fern()

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fall-list call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

function! s:on_highlight() abort
    highlight link FernBranchText Title
    highlight link FernBranchSymbol   Title
endfunction

augroup my-fern-highlight
    autocmd!
    autocmd User FernHighlight call s:on_highlight()
augroup END


function! FernOpenInFileManager() abort
  " 获取光标下文件或目录的路径
  let l:path = fern#internal#node#path(fern#helper#get_cursor_node())
  " 判断你的系统，调用不同的外部命令
  if has('mac')
    call system('open ' . shellescape(l:path))
  elseif has('unix')
    " Linux 下根据你的文件管理器修改，比如 nautilus, dolphin, thunar 等
    call system('xdg-open ' . shellescape(l:path) . ' &')
  elseif has('win32')
    call system('explorer ' . substitute(l:path, '/', '\\', 'g'))
  endif
endfunction

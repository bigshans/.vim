let g:fern#renderer = "nerdfont"

let g:fern#default_hidden = 1
let g:fern#drawer_width = 30
let g:fern#disable_default_mappings = 1
" ============ git-status ============

let g:fern_git_stats#disable_ignored = 1
let g:fern_git_stats#disable_untracked = 1

"============ git-status-end ============

nnoremap <silent> <leader>e :Fern . -drawer -toggle -width=30<CR>
autocmd BufEnter * silent! call fern#reveal(expand('%:p'))

function! s:init_fern() abort
  " Perform 'open' on leaf node and 'enter' on branch node
  nmap <buffer><expr>
            \ <Plug>(fern-my-open-or-enter)
            \ fern#smart#leaf(
            \   "<Plug>(fern-action-open:select)",
            \   "<Plug>(fern-action-enter)",
            \ )

  nmap <buffer><expr>
              \ <Plug>(fern-my-open-or-expand:select)
              \ fern#smart#leaf(
              \   "<Plug>(fern-action-open:select)",
              \   "<Plug>(fern-action-expand)",
              \ )
  nmap <buffer><expr> <Plug>(fern-my-open-external) FernOpenExternal()
  nmap <buffer> <CR> <Plug>(fern-my-open-or-enter)
  nmap <buffer> <BS> <Plug>(fern-action-leave)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-or-expand:select)
  nmap <buffer> l <Plug>(fern-my-open-or-expand:select)
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> E <Plug>(fern-action-open:vsplit)
  nmap <buffer> e <Plug>(fern-action-open:split)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> i <Plug>(fern-action-preview)
  nmap <buffer> r <Plug>(fern-action-better-rename)
  nmap <buffer> a <Plug>(fern-action-new-file)
  nmap <buffer> A <Plug>(fern-action-new-dir)
  nmap <buffer> - <Plug>(fern-action-mark:toggle)
  nmap <buffer> m <Plug>(fern-action-choice)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer><silent> f :call <SID>fern_fzf()<CR>
  nmap <buffer> F <Plug>(fern-action-include)
  nmap <buffer> c <Plug>(fern-action-lcd)
  nmap <buffer> yy <Plug>(fern-action-clipboard-copy)
  nmap <buffer> dd <Plug>(fern-action-clipboard-move)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> C <Plug>(fern-action-clipboard-clear)
  nmap <buffer> X <Plug>(fern-my-open-external)
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
    " highlight link FernBranchText Title
    " highlight link FernBranchSymbol   Title
    highlight FernBranchText guifg=#89b4fa ctermfg=111
    highlight FernBranchSymbol guifg=#89b4fa ctermfg=111
endfunction

augroup my-fern-highlight
    autocmd!
    autocmd User FernHighlight call s:on_highlight()
augroup END

function! g:FernOpenExternal() abort
  " 获取光标下文件或目录的路径
  let l:path = functions#get_fern_cursor_path()
  if l:path == ''
      return
  endif
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

function! BackToFern(isCancel) abort
  if a:isCancel != v:true
      return
  endif
  let l:fern_win = -1
  for l:w in range(1, winnr('$'))
    if getbufvar(winbufnr(l:w), '&filetype') ==# 'fern'
      let l:fern_win = l:w
      break
    endif
  endfor
  if l:fern_win != -1
      execute l:fern_win . 'wincmd w'
  endif
endfunction

function! s:fern_fzf() abort
  " 获取当前 fern 的根目录
  let l:path = functions#get_fern_cursor_path()
  if l:path == ''
      return
  elseif !isdirectory(l:path)
      let l:path = fnamemodify(l:path, ':h')
  endif
  " 获取所有窗口号
  let l:windows = range(1, winnr('$'))
  " 筛选出非 fern 的窗口
  let l:normal_wins = filter(copy(l:windows), 'getbufvar(winbufnr(v:val), "&filetype") !=# "fern"')

  " 记录 Fern 窗口号
  let l:fern_win = -1
  for l:w in range(1, winnr('$'))
    if getbufvar(winbufnr(l:w), '&filetype') ==# 'fern'
      let l:fern_win = l:w
      break
    endif
  endfor

  " 判断是否需要 choosewin
  if len(l:normal_wins) == 0
    echo "No normal windows available."
    return
  elseif len(l:normal_wins) == 1
    let l:target_win = l:normal_wins[0]
  else
    let l:before = winnr()
    ChooseWin
    let l:after = winnr()
    if l:before == l:after
      " 用户取消选择
      if l:fern_win > 0
        execute l:fern_win . 'wincmd w'
      endif
      return
    endif
    let l:target_win = l:after
  endif

  " 切换窗口并执行 LeaderF
  execute l:target_win . 'wincmd w'

  call RegisterFzfCancelCb(function("BackToFern"))

  execute 'Files ' . fnameescape(l:path)

  " if exists('g:fzfCancel') && g:fzfCancel
      " execute l:fern_win . 'wincmd w'
  " endif
endfunction

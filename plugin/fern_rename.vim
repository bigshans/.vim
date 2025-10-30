" =========================================
" Fern: Better Rename (Vimscript version)
" =========================================

if exists('g:loaded_fern_better_rename')
  finish
endif
let g:loaded_fern_better_rename = 1

" --- 定义实际 rename 函数 ---
function! s:better_fern_rename() abort
  let node = functions#get_fern_cursor_path()
  if node == ''
    echohl WarningMsg | echo "No node under cursor" | echohl None
    return
  endif

  let old_path = node
  let old_name = fnamemodify(old_path, ':t')
  let dir = fnamemodify(old_path, ':h')

  let new_name = input('Rename to: ', old_name)
  if new_name ==# '' || new_name ==# old_name
    echo "Cancelled."
    return
  endif

  let new_path = dir . '/' . new_name

  " 防止重名
  if filereadable(new_path) || isdirectory(new_path)
    echohl ErrorMsg | echo "Target already exists: " . new_name | echohl None
    return
  endif

  " 执行 rename
  try
    call rename(old_path, new_path)
    echo "Renamed: " . old_name . " → " . new_name
  catch
    echohl ErrorMsg | echo "Rename failed!" | echohl None
    return
  endtry

  " 刷新 fern
  call fern#action#call('reload')
endfunction

" --- 注册为 <Plug> 动作 ---
nnoremap <silent> <Plug>(fern-action-better-rename) :<C-u>call <SID>better_fern_rename()<CR>

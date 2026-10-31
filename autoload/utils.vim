function utils#sudo_save() abort
    if exists(':SudaWrite')
        exe 'SudaWrite'
    elseif has('nvim')
        exe 'w !pkexec tee > /dev/null %' | setl nomod
    else
        exe 'w !sudo tee %' | setl nomod
    endif
endfunction

function utils#quit() abort
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
        execute 'bdelete!'
    else
        execute 'quit!'
    endif
endfunction

function! utils#cd()
    let s = fnamemodify(resolve(expand('%:p')), ':h')
    echo 'Now root is ' . s
    exec 'cd ' . s
endfunction

function utils#add_key_literal_prefix(obj) abort
    for [l:key, l:val] in items(a:obj)
        " 1. 如果是字典，递归处理
        if type(l:val) == v:t_dict
            call utils#add_key_literal_prefix(l:val)
            
        " 2. 如果是数组且不为空
        elseif type(l:val) == v:t_list && !empty(l:val)
            " 3. 获取第一项并检查是否已经加过前缀（避免重复执行时叠加）
            let l:first = l:val[0]
            if type(l:first) == v:t_string && l:first !~ '^<key>'
                " 直接拼接纯字符串 "<key>"
                let a:obj[l:key][0] = '<key>' . l:first
            endif
        endif
    endfor
    return a:obj
endfunction

function! utils#stdpath(path)
  return substitute(a:path, '[/\\]', '/', 'g')
endfunction

" 当前目录名转成可用的 session 名（用于 :AddCurrentProject）
function! utils#project_name() abort
  let l:name = fnamemodify(getcwd(), ':t')
  return empty(l:name) ? 'root' : substitute(l:name, '[^[:alnum:]._-]', '_', 'g')
endfunction

function! utils#modify_font(delta) abort
    let l:pattern = '\v\zs\d+$'
    let l:current = matchstr(&guifont, l:pattern)
    if l:current != ''
        let l:new_size = l:current + a:delta
        let &guifont = substitute(&guifont, l:pattern, l:new_size > 1 ? l:new_size : 1, '')
    endif
endfunction

function! utils#bigger() abort
    call utils#modify_font(1)
endfunction

function! utils#smaller() abort
    call utils#modify_font(-1)
endfunction

function! utils#get_highlight_group()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

" 追加 buffer-local 清理命令到 b:undo_ftplugin
function! utils#undo_append(cmds) abort
    let l:undo = get(b:, 'undo_ftplugin', '')
    let b:undo_ftplugin = empty(l:undo) ? a:cmds : l:undo . ' | ' . a:cmds
endfunction

" 安全删除 buffer-local 映射（silent! 在 Vim 9 不能抑制 E31）
function! utils#unmap_buffer(keys) abort
    for l:key in a:keys
        for l:mode in ['n', 'x', 's', 'o', 'i', 'c', 't']
            let l:m = maparg(l:key, l:mode, 0, 1)
            if !empty(l:m) && get(l:m, 'buffer', 0)
                execute 'silent! ' . l:mode . 'unmap <buffer> ' . l:key
            endif
        endfor
    endfor
endfunction

" 把当前目录添加为项目：优先用 vim-project，否则退回 vim-session
function! utils#add_current_project() abort
    if exists(':Project')
        execute 'Project ' . fnameescape(getcwd())
    elseif exists(':SaveSession')
        execute 'SaveSession ' . utils#project_name()
    else
        echohl WarningMsg
        echomsg '需要 vim-project 或 vim-session'
        echohl None
    endif
endfunction

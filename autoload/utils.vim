scriptencoding utf-8
function! utils#sudo_save() abort
    if exists(':SudaWrite')
        exe 'SudaWrite'
    elseif has('unix')
        if has('nvim')
            exe 'w !pkexec tee > /dev/null %' | setl nomod
        else
            exe 'w !sudo tee %' | setl nomod
        endif
    else
        echohl WarningMsg
        echomsg 'Windows 下需要安装 suda.vim 才能以管理员身份保存'
        echohl None
    endif
endfunction

function! utils#quit() abort
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
        execute 'bdelete!'
    else
        execute 'quit!'
    endif
endfunction

function! utils#cd() abort
    let s = fnamemodify(resolve(expand('%:p')), ':h')
    echo 'Now root is ' . s
    exec 'cd ' . fnameescape(s)
endfunction

function! utils#add_key_literal_prefix(obj) abort
    for [l:key, l:val] in items(a:obj)
        " 1. 如果是字典，递归处理
        if type(l:val) == v:t_dict
            call utils#add_key_literal_prefix(l:val)
            
        " 2. 如果是数组且不为空
        elseif type(l:val) == v:t_list && !empty(l:val)
            " 3. 获取第一项并检查是否已经加过前缀（避免重复执行时叠加）
            let l:first = l:val[0]
            if type(l:first) == v:t_string && l:first !~# '^<key>'
                " 直接拼接纯字符串 "<key>"
                let a:obj[l:key][0] = '<key>' . l:first
            endif
        endif
    endfor
    return a:obj
endfunction

function! utils#stdpath(path) abort
  return substitute(a:path, '[/\\]', '/', 'g')
endfunction

" 统一设置当前 buffer 的缩进宽度
function! utils#set_indent(size) abort
  let &l:tabstop = a:size
  let &l:softtabstop = a:size
  let &l:shiftwidth = a:size
endfunction

" 当前目录名转成可用的 session 名（用于 :AddCurrentProject）
function! utils#project_name() abort
  let l:name = fnamemodify(getcwd(), ':t')
  return empty(l:name) ? 'root' : substitute(l:name, '[^[:alnum:]._-]', '_', 'g')
endfunction

function! utils#modify_font(delta) abort
    if empty(&guifont)
        return
    endif

    " Windows/GUI 常见格式：JetBrainsMono_NFM:h9:cANSI:qDRAFT
    let l:height = matchlist(&guifont, '\v:h(\d+)')
    if !empty(l:height)
        let l:new_size = max([str2nr(l:height[1]) + a:delta, 1])
        let &guifont = substitute(&guifont, '\v:h\zs\d+', l:new_size, '')
        return
    endif

    " 终端 GUIFont 常见格式：JetBrainsMono Nerd Font 12
    let l:pattern = '\v\zs\d+$'
    let l:current = matchstr(&guifont, l:pattern)
    if l:current !=# ''
        let l:new_size = max([str2nr(l:current) + a:delta, 1])
        let &guifont = substitute(&guifont, l:pattern, l:new_size, '')
    endif
endfunction

function! utils#bigger() abort
    call utils#modify_font(1)
endfunction

function! utils#smaller() abort
    call utils#modify_font(-1)
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

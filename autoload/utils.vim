scriptencoding utf-8
function! utils#sudo_save() abort
    " Windows：suda.vim 只适配 unix sudo（会传 -n/--），对 Win11 自带的 sudo.exe 不兼容，
    " 这里优先走 gsudo，其次 sudo + tee（两者都是外部 tee 写回原文件）
    if has('win32') || has('win64')
        let l:target = expand('%:p')
        if empty(l:target)
            echohl WarningMsg | echomsg '当前 buffer 没有文件名' | echohl None
            return
        endif
        let l:tee = executable('tee') ? 'tee' : ''
        try
            if executable('gsudo')
                execute 'silent write !gsudo tee ' . shellescape(l:target) . ' > NUL'
                setlocal nomodified
                echomsg '已通过 gsudo 保存: ' . l:target
            elseif executable('sudo') && !empty(l:tee)
                execute 'silent write !sudo ' . l:tee . ' ' . shellescape(l:target) . ' > NUL'
                setlocal nomodified
                echomsg '已通过 sudo 保存: ' . l:target
            else
                echohl WarningMsg
                echomsg 'Windows 下需要 gsudo 或 sudo + tee 才能以管理员身份保存'
                echohl None
            endif
        catch
            echohl ErrorMsg | echomsg '提权保存失败: ' . v:exception | echohl None
        endtry
        return
    endif

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
        echomsg '当前平台不支持提权保存'
        echohl None
    endif
endfunction

" =============================================================================
" Windows: 自动探测 python3 DLL
" =============================================================================
" 不写死版本号/路径：按“PATH 上的 python.exe → scoop → python.org → C:\Python3*”
" 收集所有 python3XX.dll（版本降序），最后用 python3.dll（stable ABI）兜底。
" 用 has('python3') 验证每个候选，不能用就换下一个。
function! s:push_dir(list, seen, dir) abort
    let l:d = substitute(a:dir, '[/\\]\+$', '', '')
    if empty(l:d) || has_key(a:seen, l:d) || !isdirectory(l:d)
        return
    endif
    let a:seen[l:d] = 1
    call add(a:list, l:d)
endfunction

" MSYS/Cygwin 风格的 vim 会给 /c/xxx 路径，LoadLibrary 只认 C:/xxx
function! s:winpath(path) abort
    return substitute(a:path, '^/\(\a\)/', '\u\1:/', '')
endfunction

function! utils#python3dll_candidates(...) abort
    let l:prefer = a:0 ? a:1 : ''
    let l:dirs = []
    let l:seen = {}

    " 1) PATH 上的 python.exe / python3.exe 所在目录最可信
    for l:exe in ['python.exe', 'python3.exe']
        let l:p = exepath(l:exe)
        if !empty(l:p)
            call s:push_dir(l:dirs, l:seen, fnamemodify(l:p, ':h'))
        endif
    endfor

    " 2) 常见安装位置
    for [l:base, l:pat] in [
                \ [expand('~/scoop/apps/python'), '/*'],
                \ [expand('~/AppData/Local/Programs/Python'), '/Python3*'],
                \ ['C:/', 'Python3*'],
                \ ]
        for l:d in glob(l:base . l:pat, 0, 1)
            call s:push_dir(l:dirs, l:seen, l:d)
        endfor
    endfor

    " 3) 收集候选
    let l:versioned = []
    let l:stable = []
    for l:d in l:dirs
        for l:f in glob(l:d . '/python3[0-9][0-9].dll', 0, 1)
            let l:n = matchstr(fnamemodify(l:f, ':t'), '\d\d\ze\.dll$')
            if l:n !=# ''
                " 定长前缀使 sort() 的字典序等价于版本序
                call add(l:versioned, printf('%03d:%s', str2nr(l:n), s:winpath(l:f)))
            endif
        endfor
        for l:f in glob(l:d . '/python3.dll', 0, 1)
            call add(l:stable, s:winpath(l:f))
        endfor
    endfor
    call sort(l:versioned)
    call reverse(l:versioned)
    let l:list = map(l:versioned, 'v:val[4:]')

    " 4) 用户偏好优先，例如 let g:python3_version_prefer = '3.12'
    if !empty(l:prefer)
        let l:idx = match(l:list,
                    \ 'python' . substitute(l:prefer, '\.', '', 'g') . '\.dll')
        if l:idx > 0
            call insert(l:list, remove(l:list, l:idx))
        endif
    endif

    return l:list + l:stable
endfunction

" 为 +python3/dyn 构建自动挑一个真能用的 python3 DLL；已能用时不做任何事
function! utils#init_python3() abort
    " win32unix = MSYS/Cygwin 里的 vim（Git Bash 的 /usr/bin/vim 就是），也是原生 Windows 程序
    if !(has('win32') || has('win64') || has('win32unix')) || !exists('+pythonthreedll')
        return
    endif
    " 没指定偏好版本时，已经能加载就什么都不做；
    " 指定了 g:python3_version_prefer（如 '3.12'）则先设 dll 再触发加载，让偏好版本生效
    let l:prefer = get(g:, 'python3_version_prefer', '')
    if empty(l:prefer) && has('python3')
        return
    endif
    for l:dll in utils#python3dll_candidates(l:prefer)
        let &pythonthreedll = l:dll
        if has('python3')
            return
        endif
    endfor
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

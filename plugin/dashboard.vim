function! s:dashboard_action(id) abort
    let l:cmd = get(get(b:, 'dash_map', {}), a:id, '')

    " 如果是 q，直接执行退出，不需要从 map 里找命令
    if a:id == 'q'
        confirm q
        return
    endif

    if empty(l:cmd) | return | endif

    let l:dbuf = bufnr('%')
    try
        execute l:cmd
        " 只要当前 Buffer 变了，就说明进入了新文件，此时删掉 Dashboard
        if bufexists(l:dbuf) && bufnr('%') != l:dbuf
            execute "bwipeout! " . l:dbuf
        endif
    catch
        echohl ErrorMsg | echomsg "Dashboard Error: " . v:exception | echohl None
    endtry
    redraw
endfunction

" --- 简单的随机语录获取 ---
function! s:get_random_fortune() abort
    let l:fortunes = [
        \ ["Almost every programming language is overrated.", "Larry Wall"],
        \ ["Talk is cheap. Show me the code.", "Linus Torvalds"],
        \ ["Programs must be written for people to read.", "Abelson & Sussman"],
        \ ["Complexity is the enemy of reliability.", "Anonymous"],
        \ ["Moo! Have you committed your code today?", "Vim Cow"],
        \ ["Give a man a program, frustrate him for a day.", "Waseem Latif"],
        \ ["Experience is the name everyone gives to their mistakes.", "Oscar Wilde"]
    \ ]
    " 使用微秒级时间生成随机索引
    let l:msec = str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+'))
    let l:idx = l:msec % len(l:fortunes)
    return l:fortunes[l:idx]
endfunction

" --- 构造 Startify 样式的对话框 ---
function! s:get_cowsay_box(fortune) abort
    let l:text = a:fortune[0]
    let l:auth = "- " . a:fortune[1]
    let l:width = max([len(l:text), len(l:auth) + 4])
    
    let l:top    = "  " . repeat("_", l:width + 2)
    let l:mid    = "( " . l:text . repeat(" ", l:width - len(l:text)) . " )"
    let l:author = "(   " . l:auth . repeat(" ", l:width - len(l:auth) - 2) . " )"
    let l:bottom = "  " . repeat("-", l:width + 2)
    
    return [l:top, l:mid, l:author, l:bottom, 
          \ "          o", 
          \ "           o   ^__^", 
          \ "            o  (oo)\\_______", 
          \ "               (__)\\       )\\/\\",
          \ "                  ||----w |",
          \ "                  ||     ||"]
endfunction

function! s:draw_dashboard()
    if argc() > 0 || line2byte('$') != -1 | return | endif
    enew
    setlocal buftype=nofile bufhidden=wipe noswapfile 
    setlocal nonumber norelativenumber cursorline
    setlocal filetype=dashboard

    let b:old_showtabline = &showtabline
    set showtabline=0
    autocmd BufWinLeave <buffer> let &showtabline = b:old_showtabline

    " 布局配置
    let l:left_margin = repeat(' ', 6)
    let l:container_width = 65
    let b:dash_map = {}

    let l:sessions = map(split(globpath(expand(get(g:, 'session_directory', '~/.vim/sessions')), '*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
    let l:files = filter(copy(v:oldfiles), 'filereadable(fnamemodify(v:val, ":p"))')[0:9]

    let l:output = []
    let l:item_idx = 0
    call extend(l:output, [ "" ])
    call extend(l:output, [ "" ])
    call extend(l:output, [ "" ])

    " --- 1. Header (随机语录生成) ---
    let l:fortune = s:get_random_fortune()
    let l:cow_lines = s:get_cowsay_box(l:fortune)
    
    for l:line in l:cow_lines
        " 直接叠加基础左边距，不再计算内部居中
        call add(l:output, l:left_margin . l:line)
    endfor
    call add(l:output, "")
    call add(l:output, "")

    " --- 2. MRU (左对齐) ---
    call add(l:output, l:left_margin . "MRU")
    call add(l:output, "")
    for l:f in l:files
        let l:fpath = fnamemodify(l:f, ":~:h") . "/"
        let l:fname = fnamemodify(l:f, ":t")
        call add(l:output, l:left_margin . printf("[%d]  %s%s", l:item_idx, l:fpath, l:fname))
        let b:dash_map[string(l:item_idx)] = "edit " . fnameescape(l:f)
        execute "nnoremap <buffer> <silent> " . l:item_idx . " :call <SID>dashboard_action('" . l:item_idx . "')<CR>"
        let l:item_idx += 1
    endfor
    call add(l:output, "")

    " --- 3. Sessions ---
    if !empty(l:sessions)
        call add(l:output, l:left_margin . "Sessions")
        call add(l:output, "")
        for l:s in l:sessions
            call add(l:output, l:left_margin . printf("[%d]  %s", l:item_idx, l:s))
            let b:dash_map[string(l:item_idx)] = "OpenSession " . l:s
            execute "nnoremap <buffer> <silent> " . l:item_idx . " :call <SID>dashboard_action('" . l:item_idx . "')<CR>"
            let l:item_idx += 1
        endfor
        call add(l:output, "")
    endif

    " --- 4. Actions ---
    call add(l:output, l:left_margin . "Actions")
    call add(l:output, "")
    call add(l:output, l:left_margin . "[e]  Empty Buffer")
    let b:dash_map['e'] = "enew"
    nnoremap <buffer> <silent> e :call <SID>dashboard_action('e')<CR>
    call add(l:output, l:left_margin . "[q]  Quit")
    nnoremap <buffer> <silent> q :call <SID>dashboard_action('q')<CR>

    setlocal modifiable
    call setline(1, l:output)
    setlocal nomodifiable

    " 磁吸与定位
    let l:first_ln = 0
    for l:i in range(1, line('$'))
        if getline(l:i) =~ '\[[0e]\]' | let l:first_ln = l:i | break | endif
    endfor
    if l:first_ln > 0 | call cursor(l:first_ln, len(l:left_margin) + 2) | endif

    nnoremap <buffer> <silent> j :call <SID>manual_move(1)<CR>
    nnoremap <buffer> <silent> k :call <SID>manual_move(-1)<CR>
    nnoremap <buffer> <silent> <CR> :call <SID>manual_press()<CR>
    autocmd CursorMoved <buffer> call s:snap_cursor()

    " --- 5. 颜色定义 ---
    " 关联到 Vim 标准高亮组，这样换主题时颜色会同步变化
    highlight link DashHeader   Statement    " 牛牛和对话框（通常是黄色/绿色）
    highlight link DashSection  Type         " 分类标题（通常是橙色/紫色）
    highlight link DashShortcut Special      " [数字] 快捷键（通常是红色/青色）
    highlight link DashPath     Comment      " 路径部分（使用注释色，通常较暗）
    highlight link DashFile     String       " 文件名部分（使用字符串色，通常较亮）

    syntax clear
    syntax match DashHeader   /\%<14l.*/
    syntax match DashSection  /^\s*\(MRU\|Sessions\|Actions\)/
    syntax match DashShortcut /\[[qe0-9]\+\]/
    syntax match DashPath     /\]\s\+\zs.*\//
    syntax match DashFile     /\/.\+$/
endfunction

function! s:manual_move(dir) abort
    let l:cur = line('.')
    let l:n = l:cur + a:dir
    while l:n >= 1 && l:n <= line('$')
        if getline(l:n) =~ '\[' | call cursor(l:n, 1) | return | endif
        let l:n += a:dir
    endwhile
endfunction

function! s:snap_cursor() abort
    let l:idx = stridx(getline('.'), '[')
    if l:idx != -1 | call cursor(line('.'), l:idx + 2) | endif
endfunction

function! s:manual_press() abort
    " 获取当前行方括号内的内容（支持 q, e 和数字）
    let l:key = matchstr(getline('.'), '\[\zs[qe0-9]\+\ze\]')
    if !empty(l:key)
        call s:dashboard_action(l:key)
    endif
endfunction

autocmd VimEnter * call s:draw_dashboard()

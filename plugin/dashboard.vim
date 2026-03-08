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
        \ ["Experience is the name everyone gives to their mistakes.", "Oscar Wilde"],
        \ ["麟亡星落，月死珠傷，瓶罄罍恥，芝焚蕙歎。", "庾信《思旧铭》"],
    \ ]
    " 使用微秒级时间生成随机索引
    let l:msec = str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+'))
    let l:idx = l:msec % len(l:fortunes)
    return l:fortunes[l:idx]
endfunction

function! s:get_cowsay_box(fortune) abort
    let l:use_unicode = 1
    let s:char_top_bottom   = ['-', '─'][l:use_unicode]
    let s:char_sides        = ['|', '│'][l:use_unicode]
    let s:char_top_left     = ['*', '╭'][l:use_unicode]
    let s:char_top_right    = ['*', '╮'][l:use_unicode]
    let s:char_bottom_right = ['*', '╯'][l:use_unicode]
    let s:char_bottom_left  = ['*', '╰'][l:use_unicode]
let l:text = a:fortune[0]
    let l:auth = "- " . a:fortune[1]
    
    " 计算真实显示宽度 (支持中文)
    let l:text_w = strdisplaywidth(l:text)
    let l:auth_w = strdisplaywidth(l:auth)
    " 这里的 max_w 是对话框内文字占据的最大物理宽度
    " 我们多预留一点空间（比如 4 个空格）让内容不至于太贴边
    let l:inner_w = max([l:text_w, l:auth_w + 4]) 
    
    " 1. 顶部边框
    let l:top = "  " . s:char_top_left . repeat(s:char_top_bottom, l:inner_w + 2) . s:char_top_right
    
    " 2. 内容行 (居左，后面补齐)
    " 格式：│ 内容 空格 │
    let l:text_pad = repeat(" ", l:inner_w - l:text_w)
    let l:mid = "  " . s:char_sides . " " . l:text . l:text_pad . " " . s:char_sides
    
    " 3. 作者行 (居右，前面补齐)
    " 格式：│ 空格 - 作者 │
    " 注意这里前后空格的分配，确保总长度等于 l:inner_w
    let l:auth_pad = repeat(" ", l:inner_w - l:auth_w)
    let l:author = "  " . s:char_sides . " " . l:auth_pad . l:auth . " " . s:char_sides
    
    " 4. 底部边框
    let l:bottom = "  " . s:char_bottom_left . repeat(s:char_top_bottom, l:inner_w + 2) . s:char_bottom_right
    
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
    let l:left_margin = ''
    let l:container_width = 65
    let b:dash_map = {}

    let l:sessions = map(split(globpath(expand(get(g:, 'session_directory', '~/.vim/sessions')), '*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
    let l:files = filter(copy(v:oldfiles), 'filereadable(fnamemodify(v:val, ":p"))')[0:14]

    let l:output = []
    let l:item_idx = 0
    call extend(l:output, [ "" ])

    " --- 1. Header (随机语录生成) ---
    let l:fortune = s:get_random_fortune()
    let l:cow_lines = s:get_cowsay_box(l:fortune)
    
    call add(l:output, "")
    for l:line in l:cow_lines
        " 直接叠加基础左边距，不再计算内部居中
        call add(l:output, l:left_margin . l:line)
    endfor
    call add(l:output, "")
    call add(l:output, "")
    call add(l:output, "")

    call add(l:output, l:left_margin . "[e]  <empty buffer>")
    let b:dash_map['e'] = "enew"
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
    nnoremap <buffer> <silent> e :call <SID>dashboard_action('e')<CR>
    call add(l:output, l:left_margin . "[q]  <quit>")
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
    highlight DashHeader   ctermfg=114 guifg=#89b4fa
    highlight DashSection  ctermfg=66  guifg=#928374
    highlight DashShortcut ctermfg=214 guifg=#fabd2f
    highlight DashSpecial ctermfg=214 guifg=#9399b2
    highlight DashPath     ctermfg=245 guifg=#665c54
    highlight DashFile     ctermfg=223 guifg=#ebdbb2
    " 关联到 Vim 标准高亮组，这样换主题时颜色会同步变化
    " highlight default link DashHeader   Statement    " 牛牛和对话框（通常是黄色/绿色）
    " highlight default link DashSection  Type         " 分类标题（通常是橙色/紫色）
    " highlight default link DashShortcut Special      " [数字] 快捷键（通常是红色/青色）
    " highlight default link DashPath     Comment      " 路径部分（使用注释色，通常较暗）
    " highlight default link DashComment  Comment      " 路径部分（使用注释色，通常较暗）
    " highlight default link DashFile     String       " 文件名部分（使用字符串色，通常较亮）

    syntax clear
    syntax match DashHeader   /\%<16l.*/
    syntax match DashSection  /^\s*\(MRU\|Sessions\|Actions\)/
    syntax match DashShortcut /\[[qe0-9]\+\]/
    syntax match DashPath     /\]\s\+\zs.*\//
    syntax match DashFile     /\/.\+$/
    syntax match DashSpecial /\V<empty buffer>\|<quit>/
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

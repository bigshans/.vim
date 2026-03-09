" --- 配置与变量 ---
let g:dashboard_session_dir = get(g:, 'session_directory', '~/.vim/sessions')
let g:dashboard_use_unicode = get(g:, 'dashboard_use_unicode', 1)

let s:border_h  = ['-', '─'][g:dashboard_use_unicode]
let s:border_v  = ['|', '│'][g:dashboard_use_unicode]
let s:cor_tl    = ['*', '╭'][g:dashboard_use_unicode]
let s:cor_tr    = ['*', '╮'][g:dashboard_use_unicode]
let s:cor_br    = ['*', '╯'][g:dashboard_use_unicode]
let s:cor_bl    = ['*', '╰'][g:dashboard_use_unicode]
let s:indent = 4

" --- 高亮与语法 (全蓝 Header 修复版) ---
function! s:apply_colors() abort
    if &filetype != 'custom_dash' | return | endif
    highlight link DashDim      Comment
    highlight link DashBright   String
    highlight link DashBracket  Delimiter
    highlight link DashKey      Number
    highlight link DashTitle    Type
    highlight link DashAction   Comment
    highlight DashArt ctermfg=12 guifg=#00afff gui=none

    syntax clear
    " 暴力匹配前 18 行所有非空内容，确保文字、边框、牛全蓝
    syntax match DashArt /\%<18l\s*\S.*/
    syntax match DashArt /\%<18l[\^__(oo)\\ \/\\|_w-]\+/

    syntax match DashTitle   /^\s*\(RECENT FILES\|SESSIONS\)/
    syntax match DashBracket /\[\|\]/ contained
    syntax match DashKey     /[0-9eq]\+/ contained
    syntax match DashEntry   /\[[0-9eq]\+\]/ contains=DashBracket,DashKey
    syntax match DashDim     /\]\s\+\zs.*\//
    syntax match DashBright  /\/[^/]\+$/
    syntax match DashAction  /empty buffer\|quit/
endfunction

" --- Header 生成 ---
function! s:generate_header() abort
    let l:quotes = [
                \ ["Talk is cheap. Show me the code.", "Linus Torvalds"],
                \ ["One of my most productive days was throwing away 1000 lines of code.", "Ken Thompson"],
                \ ["The world is beautiful, and outside it there is no salvation.", "Albert Camus"],
                \ ["To live is to suffer, to survive is to find some meaning in the suffering.", "Nietzsche"],
                \ ["Art is a lie that makes us realize truth.", "Pablo Picasso"],
                \ ["I would rather be a brainless ideologue than a logician without a heart.", "Fyodor Dostoevsky"]
                \ ]
    let l:seed = str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+'))
    let l:q = l:quotes[l:seed % len(l:quotes)]
    let l:text = l:q[0]
    let l:author = l:q[1]

    let l:tw = strdisplaywidth(l:text)
    let l:aw = empty(l:author) ? 0 : strdisplaywidth("- " . l:author)
    let l:iw = max([l:tw, l:aw])
    let l:pad = repeat(' ', s:indent)

    let l:res = [
                \ l:pad.s:cor_tl.repeat(s:border_h, l:iw+2).s:cor_tr,
                \ l:pad.s:border_v." ".l:text.repeat(" ", l:iw-l:tw)." ".s:border_v
                \ ]
    if !empty(l:author)
        call add(l:res, l:pad.s:border_v.repeat(" ", l:iw+2).s:border_v)
        call add(l:res, l:pad.s:border_v." ".repeat(" ", l:iw-l:aw)."- ".l:author." ".s:border_v)
    endif
    call extend(l:res, [
                \ l:pad.s:cor_bl.repeat(s:border_h, l:iw+2).s:cor_br,
                \ l:pad."          o", l:pad."           o   ^__^",
                \ l:pad."            o  (oo)\\_______", l:pad."               (__)\\       )\\/\\",
                \ l:pad."                   ||----w |", l:pad."                   ||     ||"
                \ ])
    return l:res
endfunction

" --- 构建界面 ---
function! s:build() abort
    if argc() > 0 || line2byte('$') != -1 | return | endif
    enew | setlocal buftype=nofile bufhidden=wipe noswapfile filetype=custom_dash nonumber norelativenumber cursorline
    let b:action_registry = {} | let l:idx = 0 | let l:pad = repeat(' ', s:indent)

    call append('$', ["", ""])
    call append('$', s:generate_header())

    call append('$', ["", l:pad . "[e]  empty buffer"])
    let b:action_registry['e'] = 'enew'
    execute 'nnoremap <buffer><silent> e :enew<cr>'

    let l:s_path = expand(g:dashboard_session_dir)
    if isdirectory(l:s_path)
        let l:ss = split(globpath(l:s_path, '*.vim'), '\n')
        if !empty(l:ss)
            call append('$', ["", l:pad . "SESSIONS", ""])
            for l:s in l:ss
                let l:n = fnamemodify(l:s, ':t:r')
                call append('$', l:pad.'['.l:idx.']'.repeat(' ', 2).l:n)
                let b:action_registry[string(l:idx)] = 'silent! OpenSession '.l:n
                execute 'nnoremap <buffer><silent> '.l:idx.' :silent! OpenSession '.l:n.'<cr>'
                let l:idx += 1
            endfor
        endif
    endif

    let l:rs = filter(copy(v:oldfiles), 'filereadable(expand(v:val))')
    if !empty(l:rs)
        call append('$', ["", l:pad . "RECENT FILES", ""])
        let l:show = 0
        for l:f in l:rs
            if l:f =~# g:dashboard_session_dir | continue | endif
            let l:std_f = utils#stdpath(l:f)
            let l:dir = utils#stdpath(fnamemodify(l:std_f, ":~:h")) . "/"
            let l:name = fnamemodify(l:std_f, ":t")
            call append('$', l:pad.'['.l:idx.']'.repeat(' ', 2).l:dir.l:name)
            let b:action_registry[string(l:idx)] = 'silent! edit '.fnameescape(l:std_f)
            execute 'nnoremap <buffer><silent> '.l:idx.' :silent! edit '.fnameescape(l:std_f).'<cr>'
            let l:idx += 1 | let l:show += 1
            if l:show >= 12 | break | endif
        endfor
    endif

    call append('$', ["", l:pad . "[q]  quit"])
    let b:action_registry['q'] = 'quit'
    setlocal nomodifiable | call s:apply_colors()

    " 映射跳转键
    nnoremap <buffer><silent> <cr> :call <SID>handler()<cr>
    nnoremap <buffer><silent> j :call <SID>move(1)<cr>
    nnoremap <buffer><silent> k :call <SID>move(-1)<cr>
    " 锁定翻页键，防止跳出区域
    nnoremap <buffer><silent> <C-d> :call <SID>move(1)<cr>
    nnoremap <buffer><silent> <C-u> :call <SID>move(-1)<cr>
    nnoremap <buffer><silent> q :quit<cr>

    let l:pos = search('\[')
    if l:pos > 0 | call cursor(l:pos, s:indent + 2) | endif
endfunction

" --- 辅助逻辑 ---
function! s:handler() abort
    let l:k = matchstr(getline('.'), '\[\zs[qe0-9]\+\ze\]')
    let l:c = get(b:action_registry, l:k, '')
    if !empty(l:c) | execute 'silent! ' . l:c | endif
endfunction

function! s:move(d) abort
    let l:curr = line('.')
    let l:t = l:curr + a:d
    " 循环查找下一个带有 [ ] 的行
    while l:t >= 1 && l:t <= line('$')
        if getline(l:t) =~ '\['
            call cursor(l:t, s:indent + 2)
            return
        endif
        let l:t += a:d
    endwhile
    " 如果没找到（触顶或触底），光标不动，避免滑到空白处
    call cursor(l:curr, s:indent + 2)
endfunction

augroup custom_dash
    autocmd!
    autocmd VimEnter * call s:build()
    autocmd ColorScheme * call s:apply_colors()
augroup END

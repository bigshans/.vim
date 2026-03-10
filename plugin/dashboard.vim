let g:dashboard_session_dir = get(g:, 'session_directory', '~/.vim/sessions')
let g:dashboard_use_unicode = get(g:, 'dashboard_use_unicode', 1)

let s:border_h  = ['-', '─'][g:dashboard_use_unicode]
let s:border_v  = ['|', '│'][g:dashboard_use_unicode]
let s:cor_tl    = ['*', '╭'][g:dashboard_use_unicode]
let s:cor_tr    = ['*', '╮'][g:dashboard_use_unicode]
let s:cor_br    = ['*', '╯'][g:dashboard_use_unicode]
let s:cor_bl    = ['*', '╰'][g:dashboard_use_unicode]
let s:indent = 4

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
    let l:tw = strdisplaywidth(l:q[0])
    let l:aw = empty(l:q[1]) ? 0 : strdisplaywidth("- " . l:q[1])
    let l:iw = max([l:tw, l:aw])
    let l:pad = repeat(' ', s:indent)
    let l:res = [
                \ l:pad.s:cor_tl.repeat(s:border_h, l:iw+2).s:cor_tr,
                \ l:pad.s:border_v." ".l:q[0].repeat(" ", l:iw-l:tw)." ".s:border_v
                \ ]
    if !empty(l:q[1])
        call add(l:res, l:pad.s:border_v.repeat(" ", l:iw+2).s:border_v)
        call add(l:res, l:pad.s:border_v." ".repeat(" ", l:iw-l:aw)."- ".l:q[1]." ".s:border_v)
    endif
    call extend(l:res, [
                \ l:pad.s:cor_bl.repeat(s:border_h, l:iw+2).s:cor_br,
                \ l:pad."          o", l:pad."           o   ^__^",
                \ l:pad."            o  (oo)\\_______", l:pad."               (__)\\       )\\/\\",
                \ l:pad."                   ||----w |", l:pad."                   ||     ||"
                \ ])
    return l:res
endfunction

function! s:enable_lock() abort
    if &filetype != 'custom_dash' | return | endif

    " 固定功能键
    nnoremap <buffer><silent> j :call <SID>move(1)<cr>
    nnoremap <buffer><silent> k :call <SID>move(-1)<cr>
    nnoremap <buffer><silent> h <nop>
    nnoremap <buffer><silent> l <nop>
    nnoremap <buffer><silent> gg <nop>
    nnoremap <buffer><silent> G  <nop>
    nnoremap <buffer><silent> / <nop>
    nnoremap <buffer><silent> ? <nop>
    nnoremap <buffer><silent> <C-d> :call <SID>move(1)<cr>
    nnoremap <buffer><silent> <C-u> :call <SID>move(-1)<cr>
    nnoremap <buffer><silent> <cr> :call <SID>handler()<cr>
    nnoremap <buffer><silent> q :quit<cr>

    " 动态注册表按键 (0-9, e, q 等)
    if exists('b:action_registry')
        for l:key in keys(b:action_registry)
            execute 'nnoremap <buffer><silent> ' . l:key . ' :call <SID>handler_key("' . l:key . '")<cr>'
        endfor
    endif

    " 模式与鼠标锁定
    nnoremap <buffer><silent> v <nop>
    nnoremap <buffer><silent> V <nop>
    nnoremap <buffer><silent> <C-v> <nop>
    vnoremap <buffer><silent> <ESC> <ESC>
    nnoremap <buffer><silent> <LeftMouse> <LeftMouse>:call <SID>click_key_only()<cr>
    vmap <buffer><silent> <LeftMouse> <ESC>:call <SID>click_key_only()<cr>
    vmap <buffer><silent> <2-LeftMouse> <ESC>:call <SID>click_key_only()<cr>

    augroup dash_monitor
        autocmd! * <buffer>
        autocmd CursorMoved <buffer> call s:ensure_column()
    augroup END
endfunction

function! s:disable_lock() abort
    " 彻底清除所有可能的 buffer 映射，防止溢出
    silent! bufdo execute "nunmap <buffer> j"
    " ... 为了效率，这里通常只需 mapclear <buffer>
    silent! mapclear <buffer>
    augroup dash_monitor
        autocmd! * <buffer>
    augroup END
endfunction

function! s:ensure_column() abort
    if &filetype != 'custom_dash' || mode() != 'n' | return | endif
    let l:line = getline('.')
    if l:line =~ '\['
        if col('.') != (s:indent + 2) | call cursor(line('.'), s:indent + 2) | endif
    else
        let l:pos = search('\[', 'nW')
        if l:pos == 0 | let l:pos = search('\[', 'bnW') | endif
        if l:pos > 0 | call cursor(l:pos, s:indent + 2) | endif
    endif
endfunction

function! s:move(d) abort
    let l:curr = line('.')
    let l:t = l:curr + a:d
    while l:t >= 1 && l:t <= line('$')
        if getline(l:t) =~ '\['
            call cursor(l:t, s:indent + 2)
            return
        endif
        let l:t += a:d
    endwhile
    call cursor(l:curr, s:indent + 2)
endfunction

function! s:click_key_only() abort
    let l:line = getline('.')
    let l:start = stridx(l:line, '[')
    let l:end = stridx(l:line, ']')
    let l:cur_col = col('.') - 1
    if l:start != -1 && l:end != -1 && l:cur_col > l:start && l:cur_col < l:end
        call s:handler()
    else
        call s:ensure_column()
    endif
endfunction

function! s:handler_key(k) abort
    let l:c = get(b:action_registry, a:k, '')
    if !empty(l:c)
        call s:disable_lock()
        execute 'silent! ' . l:c
    endif
endfunction

function! s:handler() abort
    let l:k = matchstr(getline('.'), '\[\zs[qe0-9]\+\ze\]')
    call s:handler_key(l:k)
endfunction

function! s:build() abort
    if argc() > 0 || line2byte('$') != -1 | return | endif
    enew | setlocal buftype=nofile bufhidden=wipe noswapfile filetype=custom_dash nonumber norelativenumber cursorline
    let b:action_registry = {} | let l:idx = 0 | let l:pad = repeat(' ', s:indent)

    call append('$', ["", ""])
    call append('$', s:generate_header())
    call append('$', ["", l:pad . "[e]  empty buffer"])
    let b:action_registry['e'] = 'enew'

    let l:s_path = expand(g:dashboard_session_dir)
    if isdirectory(l:s_path)
        let l:ss = split(globpath(l:s_path, '*.vim'), '\n')
        if !empty(l:ss)
            call append('$', ["", l:pad . "SESSIONS", ""])
            for l:s in l:ss
                let l:n = fnamemodify(l:s, ':t:r')
                call append('$', l:pad.'['.l:idx.']'.repeat(' ', 2).l:n)
                let b:action_registry[string(l:idx)] = 'silent! OpenSession '.l:n
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
            let l:idx += 1 | let l:show += 1
            if l:show >= 12 | break | endif
        endfor
    endif

    call append('$', ["", l:pad . "[q]  quit"])
    let b:action_registry['q'] = 'quit'

    setlocal nomodifiable | call s:apply_colors()
    call s:enable_lock()

    let l:pos = search('\[')
    if l:pos > 0 | call cursor(l:pos, s:indent + 2) | endif
endfunction

augroup custom_dash
    autocmd!
    autocmd VimEnter * call s:build()
    autocmd ColorScheme * call s:apply_colors()
    autocmd BufEnter <buffer> call s:enable_lock()
    autocmd BufLeave <buffer> call s:disable_lock()
augroup END

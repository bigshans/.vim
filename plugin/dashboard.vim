scriptencoding utf-8
let s:default_session_dir = empty($HOME_VIM) ? expand('~/.vim/sessions') : $HOME_VIM . '/sessions'
let g:dashboard_session_dir = get(g:, 'session_directory', s:default_session_dir)
let g:dashboard_use_unicode = get(g:, 'dashboard_use_unicode',
            \ !(has('win32') && !has('gui_running')))

let s:border_h  = ['-', '─'][g:dashboard_use_unicode]
let s:border_v  = ['|', '│'][g:dashboard_use_unicode]
let s:cor_tl    = ['*', '╭'][g:dashboard_use_unicode]
let s:cor_tr    = ['*', '╮'][g:dashboard_use_unicode]
let s:cor_br    = ['*', '╯'][g:dashboard_use_unicode]
let s:cor_bl    = ['*', '╰'][g:dashboard_use_unicode]
let s:indent = 4

" inkstone 配色下取主题调色板；其它配色返回空字典（沿用原来的 highlight link）
function! s:palette() abort
    if get(g:, 'colors_name', '') !~# '^inkstone' || !exists('*inkstone#Palette')
        return {}
    endif
    return inkstone#Palette()
endfunction

function! s:hi(group, fg, attr) abort
    let l:cterm = inkstone#Cterm(a:fg)
    let l:cterm_part = empty(l:cterm) ? '' : ' ctermfg=' . l:cterm
    let l:attr = empty(a:attr) ? 'NONE' : a:attr
    execute 'highlight' a:group
          \ 'guifg=' . a:fg . l:cterm_part
          \ 'gui=' . l:attr
          \ 'cterm=' . l:attr
endfunction

function! s:apply_colors() abort
    if &filetype !=# 'custom_dash' | return | endif
    let l:p = s:palette()
    if empty(l:p)
        highlight link DashDim      Comment
        highlight link DashBright   String
        highlight link DashBracket  Delimiter
        highlight link DashKey      Number
        highlight link DashTitle    Type
        highlight link DashAction   Comment
        highlight link DashFrame    Delimiter
        highlight link DashAuthor   Comment
        highlight link DashQuote    Normal
        highlight DashArt ctermfg=12 guifg=#00afff gui=none
    else
        " 墨观 Inkstone：纸底墨字，框线用极淡的界栏色，ASCII 小牛取水色
        call s:hi('DashDim',     l:p.comment, '')
        call s:hi('DashBright',  l:p.func,    '')
        call s:hi('DashBracket', l:p.punct,   '')
        call s:hi('DashKey',     l:p.num,     'bold')
        call s:hi('DashTitle',   l:p.keyword, 'bold')
        call s:hi('DashAction',  l:p.comment, 'italic')
        call s:hi('DashFrame',   l:p.guide,   '')
        call s:hi('DashAuthor',  l:p.comment, 'italic')
        call s:hi('DashQuote',   l:p.prop,    'italic')
        call s:hi('DashArt',     l:p.cursor,  '')
    endif
    syntax clear
    if empty(l:p)
        syntax match DashArt /\%<18l\s*\S.*/
        syntax match DashArt /\%<18l[\^__(oo)\\ \/\\|_w-]\+/
    else
        " inkstone 下把引语框拆成三段：框线 / 正文 / 署名
        syntax match DashFrame  /[│─╭╮╰╯]/
        syntax match DashQuote  /\%(│ \)\@<=\s*\zs[^-|│ ].\{-}\ze *[│]$/
        syntax match DashAuthor /\%(│ \)\@<=\s*\zs- .\{-}\ze *[│]$/
    endif
    " ASCII 小牛独占一个 region，避免误染正文里的 o/w/-
    syntax region DashArt start=/^\s*o\s*$/ end=/^\s*||\s*||$/ keepend
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
                \ ["Art is a lie that makes us realize truth.", "Pablo Picasso"]
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
    if &filetype !=# 'custom_dash' | return | endif
    nnoremap <buffer><silent> j :call <SID>move(1)<cr>
    nnoremap <buffer><silent> k :call <SID>move(-1)<cr>
    nnoremap <buffer><silent> h <nop>
    nnoremap <buffer><silent> l <nop>
    nnoremap <buffer><silent> gg :call cursor(search('\[', 'w'), stridx(getline(search('\[', 'nw')), '[')+2)<cr>
    nnoremap <buffer><silent> G  :call cursor(search('\[', 'bw'), stridx(getline(search('\[', 'bnw')), '[')+2)<cr>
    nnoremap <buffer><silent> <cr> :call <SID>handler()<cr>
    nnoremap <buffer><silent> q :quit<cr>
    " nnoremap <buffer><silent> <LeftMouse> <nop>
    nnoremap <buffer><silent> <2-LeftMouse> :call <SID>handler()<CR>
    if exists('b:action_registry')
        for l:key in keys(b:action_registry)
            execute 'nnoremap <buffer><silent> ' . l:key . ' :call <SID>handler_key("' . l:key . '")<cr>'
        endfor
    endif
    augroup dash_monitor
        autocmd! * <buffer>
        autocmd CursorMoved <buffer> call s:ensure_column()
    augroup END
endfunction

function! s:disable_lock() abort
    call utils#unmap_buffer(['j', 'k', 'h', 'l', 'gg', 'G', '<CR>', 'q', '<2-LeftMouse>'])
    if exists('b:action_registry')
        call utils#unmap_buffer(keys(b:action_registry))
    endif
    augroup dash_monitor
        autocmd! * <buffer>
    augroup END
endfunction

function! s:ensure_column() abort
    if &filetype !=# 'custom_dash' || mode() !=# 'n' | return | endif
    let l:line = getline('.')
    let l:s = stridx(l:line, '[')
    if l:s != -1
        let l:target = l:s + 2
        if col('.') != l:target | call cursor(line('.'), l:target) | endif
    else
        let l:pos = search('\[', 'nW')
        if l:pos == 0 | let l:pos = search('\[', 'bnW') | endif
        if l:pos > 0 | call cursor(l:pos, stridx(getline(l:pos), '[') + 2) | endif
    endif
endfunction

function! s:move(d) abort
    let l:curr = line('.')
    let l:t = l:curr + a:d
    while l:t >= 1 && l:t <= line('$')
        if getline(l:t) =~# '\['
            call cursor(l:t, stridx(getline(l:t), '[') + 2)
            return
        endif
        let l:t += a:d
    endwhile
    call cursor(l:curr, stridx(getline(l:curr), '[') + 2)
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
    let l:lines = ['', '']
    call extend(l:lines, s:generate_header())
    call extend(l:lines, ['', l:pad . '[e]  empty buffer'])
    let b:action_registry['e'] = 'enew'
    let l:s_path = substitute(expand(g:dashboard_session_dir), '\\', '/', 'g')
    let l:s_prefix = substitute(l:s_path, '/\+$', '', '') . '/'
    if isdirectory(l:s_path)
        let l:ss = split(globpath(l:s_path, '*.vim'), '\n')
        if !empty(l:ss)
            call extend(l:lines, ['', l:pad . 'SESSIONS', ''])
            for l:s in l:ss
                let l:n = fnamemodify(l:s, ':t:r')
                call add(l:lines, l:pad.'['.l:idx.']'.repeat(' ', 2).l:n)
                let b:action_registry[string(l:idx)] = 'silent! OpenSession '.fnameescape(l:n)
                let l:idx += 1
            endfor
        endif
    endif
    let l:rs = filter(copy(v:oldfiles), 'filereadable(expand(v:val))')
    if !empty(l:rs)
        call extend(l:lines, ['', l:pad . 'RECENT FILES', ''])
        let l:cnt = 0
        for l:f in l:rs
            let l:f_norm = substitute(l:f, '\\', '/', 'g')
            if stridx(l:f_norm, l:s_prefix) == 0 | continue | endif
            let l:dir = fnamemodify(l:f, ':~:h') . '/'
            let l:name = fnamemodify(l:f, ':t')
            call add(l:lines, l:pad.'['.l:idx.']'.repeat(' ', 2).l:dir.l:name)
            let b:action_registry[string(l:idx)] = 'silent! edit '.fnameescape(l:f)
            let l:idx += 1 | let l:cnt += 1
            if l:cnt >= 12 | break | endif
        endfor
    endif
    call extend(l:lines, ['', l:pad . '[q]  quit'])
    let b:action_registry['q'] = 'quit'
    call setline(1, l:lines)
    setlocal nomodifiable | call s:apply_colors()
    call s:enable_lock()
    let l:pos = search('\[')
    if l:pos > 0 | call cursor(l:pos, stridx(getline(l:pos), '[') + 2) | endif
endfunction

augroup custom_dash
    autocmd!
    autocmd VimEnter * call s:build()
    autocmd ColorScheme * call s:apply_colors()
    autocmd BufEnter * if &filetype == 'custom_dash' | call s:enable_lock() | endif
    autocmd BufLeave * if &filetype == 'custom_dash' | call s:disable_lock() | endif
augroup END

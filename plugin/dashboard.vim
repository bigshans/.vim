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

" --- 高亮与语法 ---
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
    syntax match DashArt     /\%<15l.*/
    syntax match DashTitle   /^\s*\(RECENT FILES\|SESSIONS\)/
    syntax match DashBracket /\[\|\]/ contained
    syntax match DashKey     /[0-9eq]\+/ contained
    syntax match DashEntry   /\[[0-9eq]\+\]/ contains=DashBracket,DashKey
    syntax match DashDim     /\]\s\+\zs.*\//
    syntax match DashBright  /\/[^/]\+$/
    syntax match DashAction /empty buffer\|quit/
endfunction

" --- Header 生成 ---
function! s:generate_header() abort
    let l:quotes = [["Talk is cheap. Show me the code.", "Linus Torvalds"], ["每一个程序都是一份送给未来的礼物。", "Vim User"]]
    let l:q = l:quotes[str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+')) % len(l:quotes)]
    let l:iw = max([strdisplaywidth(l:q[0]), strdisplaywidth("- " . l:q[1]) + 2])
    let l:pad = repeat(' ', s:indent)
    return [
        \ l:pad.s:cor_tl.repeat(s:border_h, l:iw+2).s:cor_tr,
        \ l:pad.s:border_v." ".l:q[0].repeat(" ", l:iw-strdisplaywidth(l:q[0]))." ".s:border_v,
        \ l:pad.s:border_v." ".repeat(" ", l:iw-strdisplaywidth("- ".l:q[1]))."- ".l:q[1]." ".s:border_v,
        \ l:pad.s:cor_bl.repeat(s:border_h, l:iw+2).s:cor_br,
        \ l:pad."          o", l:pad."           o   ^__^",
        \ l:pad."            o  (oo)\\_______", l:pad."               (__)\\       )\\/\\",
        \ l:pad."                   ||----w |", l:pad."                   ||     ||"]
endfunction

" --- 构建界面 ---
function! s:build() abort
    if argc() > 0 || line2byte('$') != -1 | return | endif
    enew | setlocal buftype=nofile bufhidden=wipe noswapfile filetype=custom_dash nonumber norelativenumber cursorline
    let b:action_registry = {} | let l:idx = 0 | let l:pad = repeat(' ', s:indent)

    call append('$', ["", ""])
    call append('$', s:generate_header())
    
    " Actions (小写 + 灰色高亮)
    call append('$', ["", l:pad . "[e]  empty buffer"])
    let b:action_registry['e'] = 'enew'
    nnoremap <buffer><silent> e :enew<cr>

    " Sessions (静默加载)
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

    " Recent Files (标准化路径 + 静默加载)
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
    
    nnoremap <buffer><silent> <cr> :call <SID>handler()<cr>
    nnoremap <buffer><silent> j :call <SID>move(1)<cr>
    nnoremap <buffer><silent> k :call <SID>move(-1)<cr>
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
    let l:t = line('.') + a:d
    while l:t >= 1 && l:t <= line('$')
        if getline(l:t) =~ '\[' | call cursor(l:t, s:indent + 2) | return | endif
        let l:t += a:d
    endwhile
endfunction

augroup custom_dash
    autocmd!
    autocmd VimEnter * call s:build()
    autocmd ColorScheme * call s:apply_colors()
augroup END

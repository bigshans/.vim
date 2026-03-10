function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" command! -bang Colors
" \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview())
let g:fzf_commands_expect = 'tab'
autocmd! User FzfStatusLine call <SID>fzf_statusline()
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler
            \| nmap <buffer><esc> i<C-g>
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

if index(g:packs_config_list, 'asynctasks') >= 0
    function! s:fzf_sink(what)
        let p1 = stridx(a:what, '<')
        if p1 >= 0
            let name = strpart(a:what, 0, p1)
            let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
            if name != ''
                exec "AsyncTask ". fnameescape(name)
            endif
        endif
    endfunction

    function! s:fzf_task()
        let rows = asynctasks#source(&columns * 48 / 100)
        let source = []
        for row in rows
            let name = row[0]
            let source += [name . '  ' . row[1] . '  : ' . row[2]]
        endfor
        let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                    \ 'options': '+m --nth 1 --inline-info --tac' }
        if exists('g:fzf_layout')
            for key in keys(g:fzf_layout)
                let opts[key] = deepcopy(g:fzf_layout[key])
            endfor
        endif
        call fzf#run(opts)
    endfunction

    command! -nargs=0 AsyncTaskFzf call s:fzf_task()
endif

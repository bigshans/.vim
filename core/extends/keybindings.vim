" search {{
"nnoremap <leader>sb :Buffers<CR>
"nnoremap <leader>ss :BLines<CR>
"nnoremap <leader>hh :Helptags<CR>
"nnoremap <leader>sf :Files<CR>

"nnoremap <leader>sb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
nnoremap <leader>ss :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
nnoremap <leader>hh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>

call whichkey#add('s.s', 'search lines')
call whichkey#add('s.b', 'switch buffers')
call whichkey#add('s.f', 'search files')
" }}

" open {{
nnoremap <leader>op :e $HOME/.vim/core/plugin.vim<CR>
nnoremap <leader>oC :e $HOME/.vim/coc-settings.json<CR>
nnoremap <leader>oc :<C-U><C-R>=printf("Leaderf file %s", "~/.vim/core")<CR><CR>
nnoremap <silent><leader>y :<C-u>CocList -A --normal yank<CR>

call whichkey#add("y", "yank list")
call whichkey#add('o.p', 'open plugin conf file')
call whichkey#add('o.C', 'open coc conf file')
call whichkey#add('o.c', 'open core config')
" }}

" file {{
nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

call whichkey#add('f.r', 'recently files')
" }}

" coc {{
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap T <Plug>(coc-translator-p)
vmap T <Plug>(coc-translator-pv)
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap gk :call CocActionAsync('diagnosticInfo', 'echo')<CR>

nmap <silent><leader>ja <Plug>(coc-codeaction)
nmap <silent><leader>jr <Plug>(coc-rename)
nmap <silent><leader>jf <Plug>(coc-fix-current)
nnoremap <silent><nowait> <leader>jd  :<C-u>CocList diagnostics<cr>
xmap <silent><leader>fm <Plug>(coc-format-selected)
nnoremap <silent><leader>ft :CocCommand explorer --preset<CR>
nnoremap <leader>hr :call CocActionAsync('highlight')<CR>

call whichkey#add('j.a', 'code action')
call whichkey#add('j.r', 'coc rename')
call whichkey#add('j.f', 'fix current')
call whichkey#add('j.d', 'show diagnostics')
call whichkey#add("f.t", "open file tree")
call whichkey#add("h.r", "refresh highlight")
" }}

" auto format {{
nnoremap <leader>ef  :Autoformat<CR>
vnoremap <leader>ef  :AutoformatLine<CR>
call whichkey#add('e.f', 'format')
" }}

" git {{
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gr :Git restore %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap <leader>gp :Git pull<CR>

" NO NEED to append keybinding desc

augroup AU_GIT
    autocmd!
    autocmd FileType fugitive nmap <buffer><silent>q :q<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>p :Git pull<CR>
    autocmd FileType fugitive nmap <buffer><silent><leader>P :Git push<CR>
    autocmd FileType fugitive nmap <buffer><leader>c cc
    autocmd FileType fugitive nmap <buffer><leader><leader> a
augroup END
" }}

" switch buffer {{
for s:i in range(1,9)
    exec 'nnoremap <silent><M-'.s:i.'> <Cmd>BufferLineGoToBuffer '.s:i.'<CR>'
endfor

if has('nvim')
    nnoremap <silent><leader>bn  :BufferLineCycleNext<CR>
    nnoremap <silent><leader>bp  :BufferLineCyclePrev<CR>
else
    nmap <leader>bn <Plug>lightline#bufferline#go_next()
    nmap <leader>bp <Plug>lightline#bufferline#go_previous()
    nmap <M-1> <Plug>lightline#bufferline#go(1)
    nmap <M-2> <Plug>lightline#bufferline#go(2)
    nmap <M-3> <Plug>lightline#bufferline#go(3)
    nmap <M-4> <Plug>lightline#bufferline#go(4)
    nmap <M-5> <Plug>lightline#bufferline#go(5)
    nmap <M-6> <Plug>lightline#bufferline#go(6)
    nmap <M-7> <Plug>lightline#bufferline#go(7)
    nmap <M-8> <Plug>lightline#bufferline#go(8)
    nmap <M-9> <Plug>lightline#bufferline#go(9)
    nmap <M-0> <Plug>lightline#bufferline#go(10)
endif

nnoremap <silent><leader>bd  :bdelete<CR>

call whichkey#add('b.n', 'next buffer')
call whichkey#add('b.p', 'prev buffer')
call whichkey#add('b.d', 'delete buffer')
" }}

" comment {{
if has("nvim")
    nmap <leader>ci gcc
    vmap <leader>ci gc

    nmap <leader>cb gbc
    vmap <leader>cb gb
    call whichkey#add('c.i', 'comment line')
    call whichkey#add('c.b', 'comment block')
else
    nmap <leader>ci <plug>NERDCommenterToggle
    vmap <leader>ci <plug>NERDCommenterToggle

    nmap <leader>cf <plug>NERDCommenterComment
    vmap <leader>cf <plug>NERDCommenterComment

    call whichkey#add('c.i', 'comment code')
    call whichkey#add('c.f', 'comment force')
endif
" }}

" plugin {{
nnoremap <leader>Pi  :PlugInstall<CR>
nnoremap <leader>Pc  :PlugClean<CR>
nnoremap <leader>Pp  :PlugUpdate<CR>

call whichkey#add('Pi', 'plugin install')
call whichkey#add('Pc', 'plugin clean')
call whichkey#add('Pp', 'plugin update')
" }}

" ranger {{
if has('nvim')
    tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
    nnoremap <silent> <M-o> :RnvimrToggle<CR>
    tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
    augroup Ranger
        autocmd!
        autocmd FileType rnvimr nmap <buffer>q :q<CR>
    augroup END
endif
" }}

" run code {{
if has('nvim')
    nnoremap <leader>rc :SnipRun<CR>
    vnoremap <leader>rc :SnipRun<CR>

    call whichkey#add('r.c', 'run current code')
endif
" }}

" interestingwords {{
nnoremap <silent> * :call InterestingWords('n')<cr>
" }}

" todo comments {{
if has('nvim')
    nnoremap <silent> <leader>tc :TodoLocList<CR>
    call whichkey#add('t.c', 'show todo comments')
else
    noremap <leader>tr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>td :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>to :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    noremap <leader>tn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    noremap <leader>tp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
    noremap <leader>tu :<C-U><C-R>=printf("Leaderf gtags --update")<CR><CR>
    noremap <leader>tt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
    call whichkey#add('t.r', 'gtags references')
    call whichkey#add('t.d', 'gtags define')
    call whichkey#add('t.o', 'gtags call')
    call whichkey#add('t.n', 'gtags next')
    call whichkey#add('t.p', 'gtags previous')
    call whichkey#add("t.u", "gtags update")
    call whichkey#add("t.t", "buffer tag")
endif
" }}

" choosewin {{
nnoremap <leader>w0 :ChooseWin<CR>
nnoremap <leader>wc :ChooseWinSwap<CR>

call whichkey#add('w.0', 'choose win')
call whichkey#add('w.c', 'swap win')
" }}

" grammarous {{
" let g:grammarous#hooks = {}
" function! g:grammarous#hooks.on_check(errs) abort
    " nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    " nmap <buffer><C-f> <Plug>(grammarous-fixit)
    " nmap <buffer><C-a> <Plug>(grammarous-fixall)
    " nmap <buffer><C-c> :GrammarousReset<CR>
    " nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    " nmap <buffer><C-i> <Plug>(grammarous-open-info-window)
" endfunction

" function! g:grammarous#hooks.on_reset(errs) abort
    " nunmap <buffer><C-n>
    " nunmap <buffer><C-f>
    " nunmap <buffer><C-a>
    " nunmap <buffer><C-c>
    " nunmap <buffer><C-p>
    " nunmap <buffer><C-i>
" endfunction

" nmap <leader>GC :GrammarousCheck<CR>
" vmap <leader>GC :GrammarousCheck<CR>
" nmap <leader>GU :GrammarousReset<CR>

" call whichkey#add("G.C", "grammar check")
" call whichkey#add("G.U", "grammar check reset")
" }}

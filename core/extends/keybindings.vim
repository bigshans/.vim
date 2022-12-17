" search {{
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>ss :BLines<CR>
nnoremap <leader>hh :Helptags<CR>
nnoremap <leader>sf :Files<CR>

call whichkey#add('s.s', 'search lines')
call whichkey#add('s.b', 'switch buffers')
call whichkey#add('s.f', 'search files')
" }}

" open {{
nnoremap <leader>op :e $HOME/.vim/core/plugin.vim<CR>
nnoremap <leader>oC :e $HOME/.vim/coc-settings.json<CR>

call whichkey#add('o.p', 'open plugin conf file')
call whichkey#add('o.C', 'open coc conf file')
" }}

" file {{
nnoremap <leader>fr :History<CR>

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

nmap <silent><leader>ca <Plug>(coc-codeaction)
nmap <silent><leader>cr <Plug>(coc-rename)
nmap <silent><leader>cm <Plug>(coc-format-selected)
xmap <silent><leader>cm <Plug>(coc-format-selected)
nnoremap <silent><leader>ft :CocCommand explorer --preset<CR>

call whichkey#add("f.t", "open file tree")
call whichkey#add('c.a', 'code action')
call whichkey#add('c.r', 'rename')
call whichkey#add('c.m', 'format')
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
nnoremap <silent><M-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><M-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><M-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><M-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><M-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><M-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><M-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><M-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><M-9> <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <silent><leader>bn  :BufferLineCycleNext<CR>
nnoremap <silent><leader>bp  :BufferLineCyclePrev<CR>

call whichkey#add('b.n', 'next buffer')
call whichkey#add('b.p', 'prev buffer')
" }}

" comment {{
nmap <leader>ci gcc
vmap <leader>ci gc

nmap <leader>cb gbc
vmap <leader>cb gb

call whichkey#add('c.i', 'comment line')
call whichkey#add('c.b', 'comment block')
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
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
augroup Ranger
    autocmd!
    autocmd FileType rnvimr nmap <buffer>q :q<CR>
augroup END
" }}

" run code {{
nnoremap <leader>rc :SnipRun<CR>
vnoremap <leader>rc :SnipRun<CR>

call whichkey#add('r.c', 'run current code')
" }}

" interestingwords {{
nnoremap <silent> * :call InterestingWords('n')<cr>
" }}

"======================
" Coc Plugins
"======================
let g:coc_global_extensions = [
            \ '@yaegassy/coc-volar',
            \ 'coc-clangd',
            \ 'coc-css',
            \ 'coc-deno',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-stylua',
            \ 'coc-tabnine',
            \ 'coc-toml',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-xml',
            \ 'coc-yank',
            \ 'coc-pairs'
            \]
"======================
" Commands
"======================
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" ====================
" Text Object
" ====================

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"======================
" Auto Complete Keymap
"======================

inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \   coc#expandableOrJumpable() ?
            \     "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \     "\<TAB>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

" ======================
" Snippet
" ======================
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" ======================
" Plugin Keymap
" ======================

nnoremap <silent>\ :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>
nnoremap <silent><leader>ft :CocCommand explorer --toggle --sources=buffer-,file+ --preset<CR>
nnoremap <leader>oC :CocConfig<CR>

" =====================
" LSP Keymap
" =====================

nmap <silent><leader>ja <Plug>(coc-codeaction)
nmap <silent><leader>jc <Plug>(coc-diagnostic-info)
" nnoremap <silent><nowait> <leader>jd  :<C-u>CocList quickfix<cr>
nnoremap <silent><nowait> <leader>jd  :CocList diagnostics<cr>
nmap <silent><leader>jf <Plug>(coc-fix-current)
nmap <silent><leader>jF :call CocActionAsync('fixAll')<cr>
nmap <silent><leader>jr <Plug>(coc-rename)
nnoremap <silent><nowait> <leader>jl <Plug>(coc-codelens-action)
" Remap keys for applying refactor code actions
nmap <silent> <leader>je <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>jF  <Plug>(coc-codeaction-refactor-selected)
nmap <silent><nowait>> <leader>jk :call ShowDocumentation()<CR>
nnoremap <silent><nowait> <leader>jo  :call ToggleOutline()<CR>
nnoremap <leader>jD :let b:coc_suggest_disable = !get(b:, 'coc_suggest_disable', 0)<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

autocmd BufEnter * call CheckOutline()
function! CheckOutline() abort
    if &filetype ==# 'coctree' && winnr('$') == 1
        if tabpagenr('$') != 1
            close
        else
            bdelete
        endif
    endif
endfunction

function! ToggleOutline() abort
    let winid = coc#window#find('cocViewId', 'OUTLINE')
    if winid == -1
        call CocActionAsync('showOutline', 1)
    else
        call coc#window#close(winid)
    endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap T <Plug>(coc-translator-p)
vmap T <Plug>(coc-translator-pv)
nnoremap <silent><nowait> K :call ShowDocumentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap T <Plug>(coc-translator-p)
vmap T <Plug>(coc-translator-pv)
nnoremap <silent><nowait> K :call ShowDocumentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

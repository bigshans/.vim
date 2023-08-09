" mode: coc
call DetectKeyMapRegister(g:navigator, "<leader>")
call DetectKeyMapRegister(g:navigator_x, "<leader>")

let g:navigator["<leader>"].j = {
            \ 'name': "coc...",
            \ 'a': ['<plug>(coc-codeaction)', 'code action'],
            \ 'c': ['<plug>(coc-diagnostic-info)', 'current position diagnostic'],
            \ 'd': [':CocList diagnostic', 'show diagnostic list'],
            \ 'e': ['<plug>(coc-codeaction-refactor)', 'refactor'],
            \ 'f': ['<plug>(coc-fix-current)', 'auto fix current'],
            \ 'l': ['<plug>(coc-codelens-action)', 'codelens-action'],
            \ 'r':  ['<plug>(coc-rename)', 'rename'],
            \ }

" leader {{

nmap <silent><leader>ja <Plug>(coc-codeaction)
nmap <silent><leader>jc <Plug>(coc-diagnostic-info)
nnoremap <silent><nowait> <leader>jd  :<C-u>CocList diagnostics<cr>
nmap <silent><leader>jf <Plug>(coc-fix-current)
nmap <silent><leader>jr <Plug>(coc-rename)

nnoremap <leader>jl <Plug>(coc-codelens-action)

" Remap keys for applying refactor code actions
nmap <silent> <leader>je <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>jF  <Plug>(coc-codeaction-refactor-selected)

" }}

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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

nnoremap <silent><leader>y :<C-u>CocList -A --normal yank<CR>

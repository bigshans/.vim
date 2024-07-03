let g:ale_echo_delay = 100
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_info=''
let g:ale_sign_error='✘'
let g:ale_sign_warning="\uf529"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_log_str = 'L'
let g:ale_echo_msg_format = '[%linter%:] %s [%severity%]'
let g:ale_virtualtext_cursor = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_deno_lsp_project_root = 'deno.json,deno.jsonc,import_map.json'
" let g:ale_linters = {
"     \ 'javascript': ['tsserver', 'eslint', 'prettier'],
"     \ 'javascriptreact': ['tsserver', 'eslint', 'prettier'],
"     \ 'typescript': ['tsserver', 'eslint', 'prettier'],
"     \ 'typescriptreact': ['tsserver', 'eslint', 'prettier'],
"   \ }
let s:use_coc_diagnostics = v:false
" 禁用默认 linter ，以让 coc 生效。
if s:use_coc_diagnostics
    let s:js_linter = ['deno', 'tsserver', 'eslint', 'prettier']
    let g:ale_linters_ignore = {
        \ 'typescript': s:js_linter,
        \ 'typescriptreact': s:js_linter,
        \ 'javascriptreact': s:js_linter,
        \ 'javascript': s:js_linter,
        \ 'vue': s:js_linter,
        \ }
endif

" let g:lightline#ale#indicator_ok = "\uf00c "
" let g:lightline#ale#indicator_warnings = "\uf529 "
" let g:lightline#ale#indicator_errors = "\uf659 "
" let g:lightline#ale#indicator_infos = "\uf129 "
" let g:lightline#ale#indicator_checking = "\uf110"

" 暂时处理
" autocmd BufWritePost * call ale#engine#SetResults(bufnr(''), g:ale_buffer_info[bufnr('')].loclist)

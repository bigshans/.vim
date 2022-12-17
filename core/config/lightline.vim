let g:vim_lightline_artify = 1
let g:vim_mode = 'full'
let g:lightline = { 'enable': { 'tabline': 0 } }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightline.active = {
            \ 'left': [ [ 'artify_mode', 'winnr', 'paste', 'readonly' ],
            \           ['filename', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [
            \ [ 'artify_lineinfo' ],
            \            [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
            \           [ 'asyncrun_status', 'coc_status' ],
            \ [ 'git_global' ],
            \ ]
            \ }
let g:lightline.inactive = {
            \ 'left': [ [ 'filename', 'winnr', 'modified', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [ ['artify_lineinfo',   'git_global' ] ]
            \ }
let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'custom#lightline#artify_active_tabnum',
            \ 'artify_inactivetabnum': 'custom#lightline#artify_inactive_tabnum',
            \ 'artify_filename': 'custom#lightline#artify_tabname',
            \ 'tabnum': 'custom#lightline#tabnum',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly'
            \ }
let g:lightline.component = {
            \ 'git_buffer' : '%{get(b:, "coc_git_status", "")}',
            \ 'git_global' : '%{custom#lightline#git_global()}',
            \ 'artify_mode': '%{custom#lightline#artify_mode()}',
            \ 'artify_lineinfo': "%2{custom#lightline#artify_line_percent()}\uf295 %3{custom#lightline#artify_line_num()}:%-2{custom#lightline#artify_column_num()}",
            \ 'vim_logo': "\ue7c5",
            \ 'mode': '%{lightline#mode()}',
            \ 'filename': '%t',
            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
            \ 'modified': '%M',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': "%{ &readonly ? '' : '' }",
            \ 'lineinfo': '%2p%% %3l:%-2v',
            \ 'winnr': '%{custom#lightline#winnr()}',
            \ }
let g:lightline.component_function = {
            \ 'devicons_filetype': 'custom#lightline#devicons',
            \ 'coc_status': 'custom#lightline#coc_status',
            \ 'method': 'custom#lightline#nearest_method_or_function',
            \ }
let g:lightline.component_expand = {
            \ 'linter_warnings': 'custom#lightline#coc_diagnostic_warning',
            \ 'linter_errors': 'custom#lightline#coc_diagnostic_error',
            \ 'linter_ok': 'custom#lightline#coc_diagnostic_ok',
            \ 'asyncrun_status': 'lightline#asyncrun#status',
            \ }
let g:lightline.component_type = {
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ }
call custom#colorscheme#sonokai_atlantis()

"-----------------------*-----------------------------"
"NerdTree config
let g:NERDTreeWinSize=30
let g:NERDTreeDirArrows=1
"change pointer
let g:NERDTreeDirArrowExpandable = '‣'
let g:NERDTreeDirArrowCollapsible = '▾'
"show line num
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
let NERDTreeWinPos=1
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"-----------------------*-----------------------------"
"aireline config
let g:airline_powerline_fonts = 1
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
"关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"设置主题
"let g:airline_theme='bubblegum'
" let g:airline_theme='powerlineish'
" let g:airline_theme='tomorrow'
let g:airline_theme='one'
"let g:airline_theme='molokai'
" let g:airline_theme='monochrome'
" let g:airline_theme='solarized'
let Powerline_symbols='fancy'
"-----------------------*-----------------------------"
"Ycm config
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_semantic_triggers = {
            \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
            \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
            \     'perl' : ['->', '::', ' '],
            \     'php' : ['->', '::', '.'],
            \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
            \     'ruby' : ['.', '::'],
            \     'lua' : ['.', ':']
            \ }
let g:ycm_collect_identifiers_from_tag_files = 1
set completeopt=longest,menu
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_comments=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚡'
"-----------------------*-----------------------------"
"javacomplete2 config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"-----------------------*-----------------------------"
"UltiSnips config

"-----------------------*-----------------------------"
"nerdcommenter config
let g:NERDSpaceDelims=1
" <leader>cc   加注释
" <leader>cu   解开注释
"-----------------------*-----------------------------"
"delimitMate config
" let g:delimitMate_expand_cr = 1
"-----------------------*-----------------------------"
"indentLine  config
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"-----------------------*-----------------------------"
"startify config
source $HOME/.vim/config/logo.vim
if exists('g:aerian_s_vim_logo')
    let g:startify_custom_header = g:aerian_s_vim_logo[Rand()%len(g:aerian_s_vim_logo)]
endif
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
" start with NERDTree
" autocmd VimEnter *
            " \   if !argc()
            " \ |   Startify
            " \ |   NERDTree
            " \ |   wincmd w
            " \ | endif
let g:startify_custom_header = s:filter_header(g:startify_custom_header)
let g:startify_session_autoload = 1
let  g:startify_files_number = 20

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
            \ 'bundle/.*/doc',
            \ '.vim/plugin/.*',
            \ '.vim/syntax/.*',
            \ '.vim/plugin/.*',
            \ '.vim/doc/.*',
            \ ]
"-----------------------*-----------------------------"
"leaderf
" let g:Lf_ShowRelativePath = 0
" let g:Lf_HideHelp = 1
" let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

" let g:Lf_NormalMap = {
            " \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            " \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            " \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            " \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            " \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            " \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            " \ }
"-----------------------*-----------------------------"
"vim-mutliple-cursors
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
"-----------------------*-----------------------------"
"auto-pair
"
"-----------------------*-----------------------------"
"vim-repl
let g:repl_program = {
            \ "python": "python3",
            \ "default" : "zsh",
            \}
let g:repl_exit_commands = {
            \ "python" : "exit()",
            \ "python3" : "exit()",
            \ "bash" : "exit",
            \"zsh":"exit",
            \"default":"exit",
            \}
"-----------------------*-----------------------------"
"ale
" let g:ale_javascript_eslint_ecutable = 'special-eslint'
let g:ale_vue_vls_executable = 'vls'
let g:ale_javascript_eslint_use_global=1
let g:ale_use_global_executables = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changer = 'never'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_java_javac_options = '-encoding UTF-8 -J-Duser.language=en'
let g:ale_linters = {
            \ 'js': ['eslint'],
            \ 'vue':['vls'],
            \}
let g:ale_fixers = {
            \ 'javascript':['eslint'],
            \ 'vue':['prettier'],
            \}
" let g:ale_completion_enabled=1
let g:LanguageClient_serverCommands = {
            \ 'vue' : ['vue']
            \ }
"-----------------------*-----------------------------"
"vim-autoformat
let g:formatdef_my_custom_c="astyle --style=1tbs"
"-----------------------*-----------------------------"
"vim-quickrun
let g:quickrun_config = {
            \ "_" : {
            \ "outputter" : "message",
            \},
            \}
let g:quickrun_no_default_key_mappings = 1
"-----------------------*-----------------------------"
"vim-interestingword

"-----------------------*-----------------------------"
"undotree

"-----------------------*-----------------------------"
"rainbow_parenthess
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"-----------------------*-----------------------------"
"vim-expand-region
let g:expand_region_usr_select_mode = 1

" -----------------------*-----------------------------"
"  CompleteParameter.vim
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" -----------------------*-----------------------------"
"  vim-vue
let g:vue_disable_pre_processors=1
" -----------------------*-----------------------------"
"  deoplete
call deoplete#custom#option({
            \ 'auto_complete_delay' : 100,
            \ 'min_pattern_length' : 1,
            \ })
call deoplete#custom#source('_', 'mathers', ['matcher_full_fuzzy'])
" autocmd FileType python
" \ call deoplete#custom#buffer_option('auto_complete', v:false)
" autocmd FileType c
" \ call deoplete#custom#buffer_option('auto_complete', v:false)
" autocmd FileType cpp
" \ call deoplete#custom#buffer_option('auto_complete', v:false)
" -----------------------*-----------------------------"
"  deoplete-tern
" Set bin if you have many instalations
" let g:deoplete#sources#ternjs#tern_bin = '/path/to/tern_bin'
" let g:deoplete#sources#ternjs#timeout = 1
"
" " Whether to include the types of the completions in the result data.
" Default: 0
" let g:deoplete#sources#ternjs#types = 1
"
"" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" " data. Default: 0
" let g:deoplete#sources#ternjs#depths = 1
"
" " Whether to include documentation strings (if found) in the result data.
" " Default: 0
" let g:deoplete#sources#ternjs#docs = 1
"
" " When on, only completions that match the current word at the given point
" will
" " be returned. Turn this off to get all results, so that you can filter on
" the
" " client side. Default: 1
" let g:deoplete#sources#ternjs#filter = 0
"
"" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
" let g:deoplete#sources#ternjs#case_insensitive = 1
"
" " When completing a property and no completions are found, Tern will use
" some
" " heuristics to try and return some properties anyway. Set this to 0 to
" " turn that off. Default: 1
" let g:deoplete#sources#ternjs#guess = 0
"
"" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" " the word. When enabled (the default), the whole variable name that the
" cursor
" " is on will be included. Default: 1
" let g:deoplete#sources#ternjs#expand_word_forward = 0
"
" " Whether to ignore the properties of Object.prototype unless they have been
" " spelled out by at least two characters. Default: 1
" let g:deoplete#sources#ternjs#omit_object_prototype = 0
"
" " Whether to include JavaScript keywords when completing something that is
" not
" " a property. Default: 0
" let g:deoplete#sources#ternjs#include_keywords = 1
"
" " If completions should be returned when inside a literal. Default: 1
" let g:deoplete#sources#ternjs#in_literal = 0
"
"
""Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
            \ 'jsx',
            \ 'javascript.jsx',
            \ 'vue',
            \ ]
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" -----------------------*-----------------------------"
"  deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"-----------------------*-----------------------------"
" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
"-----------------------*-----------------------------"
" easymotion
let g:EasyMotion_do_mappings = 0
" -----------------------*-----------------------------"
" vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

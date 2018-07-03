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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"-----------------------*-----------------------------"
"aireline config
let g:airline_powerline_fonts = 1 
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错" 
""我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer" 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
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
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrgger="<C-b>"
let g:UltiSnipsListSnippets="<C-\>"
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
let g:indentLine_char = '¦' 
let g:indentLine_color_term = 239 

"-----------------------*-----------------------------"
"startify config
let g:startify_session_autoload = 1
let  g:startify_files_number = 20
"-----------------------*-----------------------------"
"leaderf
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }
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

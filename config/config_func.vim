function! g:NERDTreeConfig()
    "NerdTree config
    let g:NERDTreeWinSize=30
    let g:NERDTreeDirArrows=1
    "change pointer
    let g:NERDTreeDirArrowExpandable = '‣'
    let g:NERDTreeDirArrowCollapsible = '▾'
    "show line num
    let g:NERDTreeShowLineNumbers=0
    let g:NERDTreeAutoCenter=1
    let g:NERDTreeWinPos=1
    " autocmd vimenter * NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
endfunction

function! g:AirlineConfig()     
    "aireline config
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#fnametruncate = 16
    let g:airline#extensions#tabline#fnamecollapse = 2
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#whitespace#symbol = '!'
    "let g:airline_theme='bubblegum'
    " let g:airline_theme='powerlineish'
    " let g:airline_theme='tomorrow'
    let g:airline_theme='atomic'
    " let g:airline_theme='violet'
    "let g:airline_theme='molokai'
    " let g:airline_theme='monochrome'
    " let g:airline_theme='solarized'
    let Powerline_symbols='fancy'
    let airline#extensions#ale#error_symbol = '✗'
    let airline#extensions#ale#warning_symbol = '⚠'
    function! AirlineInit()
        let g:airline_section_a=airline#section#create_left(['mode','⌥ %{winnr()} %'])
    endfunction
    function! g:AirlineInactive(...)
        let builder = a:1
        let context = a:2
        call builder.add_section('winnr', "⎇  ".context['winnr'])
        call builder.split()
        call builder.add_section('file', '%F')
        call builder.split()
        call builder.add_section('airline_z', '%p%%')
        return 1
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
    autocmd User AirlineAfterInit call airline#add_inactive_statusline_func('AirlineInactive')
endfunction

function! g:YcmConfig()     
    "Ycm config
    let g:ycm_allow_changing_updatetime = 0
    let g:ycm_show_diagnostics_ui = 1
    let g:ycm_enable_diagnostic_signs = 0 
    let g:ycm_enable_diagnostic_highlighting = 0
    let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
    let g:ycm_collect_identifiers_from_tag_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_server_log_level='info'
    let g:ycm_confirm_extra_conf=0
    let g:ycm_semantic_triggers = {
                \     'perl' : ['->', '::', ' '],
                \     'php' : ['->', '::', '.'],
                \   'javascript': ['re!\w{2}'],
                \   'typescript': ['re!\w{2}', '.'],
                \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
                \     'ruby' : ['.', '::'],
                \     'lua' : ['.', ':'],
                \ 'python,java,go,erlang,perl': ['re!\w{1}'],
                \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                \            're!\[.*\]\s'],
                \   'ocaml': ['.', '#'],
                \   'cuda': ['->', '.', '::'],
                \   'erlang': [':'],
                \ }
    let g:ycm_filetype_whitelist = { 
                \ "java":1,
                \ }
    let g:ycm_collect_identifiers_from_tag_files = 1
    let g:ycm_enable_diagnostic_signs=0
    set completeopt=longest,menu
    " set completeopt-=preview
    let g:ycm_cache_omnifunc=0
    let g:ycm_complete_in_comments=1
    let g:ycm_min_num_of_chars_for_completion=1
    let g:ycm_error_symbol = '✗'
    let g:ycm_warning_symbol = '⚡'
    let g:ycm_key_invoke_completion='<c-z>'
    let g:ycm_max_num_candidates = 10
endfunction

function! g:Javacomplete2Config()
    "javacomplete2 config
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    let g:JavaComplete_UsePython3 = 1
endfunction

function! g:UltiSnipsConfig()
endfunction

function! g:NERDCommenterConfig()
    "nerdcommenter config
    let g:NERDSpaceDelims=1
    " <leader>cc   加注释
    " <leader>cu   解开注释
endfunction

function! g:DelimitMateConfig()
    "delimitMate config
    " let g:delimitMate_expand_cr = 1
endfunction

function! g:IndentLineConfig()
    " indentLine config
    let g:indentLine_char = '┊'
    let g:indentLine_leadingSpaceChar = '·'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_color_tty_light = 7
    let g:indentLine_color_dark = 1
    " let g:indentLine_bgcolor_term = 202
    " let g:indentLine_bgcolor_gui = '#FF5F00'
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 2
    let g:vim_json_syntax_conceal=0
    let g:indentLine_enabled=0
endfunction

function! g:StartifyConfig()
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
    let  g:startify_files_number = 15

    let g:startify_skiplist = [
                \ 'COMMIT_EDITMSG',
                \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
                \ 'bundle/.*/doc',
                \ '.vim/plugin/.*',
                \ '.vim/syntax/.*',
                \ '.vim/plugin/.*',
                \ '.vim/doc/.*',
                \ ]
endfunction

function! g:LeaderfConfig()
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
endfunction

function! g:VimMulipleCursorsConfig()    
    "vim-mutliple-cursors
    highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    highlight link multiple_cursors_visual Visual
endfunction

function! g:AutoPairConfig()
endfunction

function! g:VimRepl()    
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
endfunction

function! g:AleConfig()
    "ale
    " let g:ale_javascript_eslint_ecutable = 'special-eslint'
    let g:ale_python_pylint_executable = 'python3'   " or 'python' for Python 2
    let g:ale_python_pylint_options = '--rcfile /path/to/pylint.rc'
    " The virtualenv detection needs to be disabled.
    let g:ale_python_pylint_use_global = 1
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
                \ 'python3':['yapf']
                \}
    let g:ale_completion_enabled=0
    let g:ale_completion_delay = 0
    let g:ale_java_javalsp_jar='/home/aerian/.aerian.vim/java-language-server/out/fat-jar.jar'
    let g:ale_completion_max_suggestions=1
endfunction

function! g:LanguageClientConfig()
    " LanguageClient
    let g:LanguageClient_autoStart=1
    let g:LanguageClient_serverCommands = {
                \ 'java':['/mnt/D/jdtl/jdtls'],
                \ }
endfunction

function! g:VimAutoformatConfig()
    "vim-autoformat
    let g:formatdef_my_custom_c="astyle --style=1tbs"
    let g:formatdef_yapf_style= 'pep8'
endfunction

function! g:VimQuickrunConfig()
    "vim-quickrun
    let g:quickrun_config = {
                \ "_" : {
                \ "outputter" : "message",
                \},
                \}
    let g:quickrun_no_default_key_mappings = 1
endfunction

function! g:VimInterestingwordConfig()
endfunction

function! g:UndotreeConfig()
endfunction

function! g:RainbowParenthessConfig()
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
endfunction

function! g:VimExpandRegionConfig()
    "vim-expand-region
    let g:expand_region_usr_select_mode = 1
endfunction

function! g:VimVueConfig()
    let g:vue_disable_pre_processors=1
endfunction

function! g:DeopleteConfig()
    "  deoplete
    call deoplete#custom#option({
                \ 'auto_complete_delay' : 0,
                \ 'min_pattern_length' : 1,
                \ })
    call deoplete#custom#source('_', 'mathers', ['matcher_full_fuzzy'])
    call deoplete#custom#source('LanguageClient',
    \ 'min_pattern_length',
    \ 1)
    " call deoplete#custom#option('omni_patterns', {
                " \ 'java': '[^. *\t]\.\w*',
                " \})
    " Eclim support
    " See https://www.reddit.com/r/vim/comments/5xspok/trouble_with_eclim_and_deoplete/
    "
    " Autoclose preview windows
    " https://github.com/Shougo/deoplete.nvim/issues/115
    " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " https://github.com/Shougo/deoplete.nvim/issues/100
    " use tab to forward cycle
    " inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " use tab to backward cycle
    " inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

    " Lazy load Deoplete to reduce statuptime
    " See manpage
    " Enable deoplete when InsertEnter.
    " autocmd InsertEnter * call deoplete#enable()
    " let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
    " let g:deoplete#omni#input_patterns.java = [
                " \'[^. \t0-9]\.\w*',
                " \'[^. \t0-9]\->\w*',
                " \'[^. \t0-9]\::\w*',
                " \]
    " let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
    " let g:deoplete#ignore_sources = {}
    " let g:deoplete#ignore_sources._ = ['javacomplete2']
    " inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
    " autocmd FileType python
    " \ call deoplete#custom#buffer_option('auto_complete', v:false)
    " autocmd FileType c
    " \ call deoplete#custom#buffer_option('auto_complete', v:false)
    " autocmd FileType cpp
    " \ call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

function! g:DeopleteTernConfig()
    "  deoplete-tern
    " Set bin if you have many instalations
    let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
    " let g:deoplete#sources#ternjs#timeout = 1
    "
    " " Whether to include the types of the completions in the result data.
    " Default: 0
    let g:deoplete#sources#ternjs#types = 1
    "
    "" Whether to include the distance (in scopes for variables, in prototypes for properties) between the completions and the origin position in the result
    " " data. Default: 0
    " let g:deoplete#sources#ternjs#depths = 1
    "
    " " Whether to include documentation strings (if found) in the result data.
    " " Default: 0
    let g:deoplete#sources#ternjs#docs = 1
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
    let g:deoplete#sources#ternjs#include_keywords = 1
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
endfunction

function! g:DeopleteJediConfig()
    "  deoplete-jedi
    let g:deoplete#sources#jedi#server_timeout = 10
    let g:deoplete#sources#jedi#statement_lenght = 120
    let g:deoplete#sources#jedi#show_docstring = 1
    let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
endfunction

function! g:DeopleteClangConfig()
    "  deoplete-clang
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
endfunction

function! g:NERDTreeGitPluginConfig()
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
endfunction

function! g:EasymotionConfig()
    let g:EasyMotion_do_mappings = 0
endfunction

function! g:VimDeviconsConfig()
    " vim-devicons
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    " let g:webdevicons_conceal_nerdtree_brackets = 0
    " let g:DevIconsEnableFoldersOpenClose = 1
    " let g:WebDevIconsUnicodeDecorateFolderNodes = 1
endfunction

function! g:VimFollowMyLeadConfig()
    " vim-follow-my-lead
    let g:fml_all_sources = 1
endfunction

function! g:VimLeaderGuideConfig()
    " vim-leader-guide
    " let g:lmap = {
    " \ }
    " let g:lmap.s = {'name' : 'source/search/screencenter prefix'}
    " let g:lmap.f = {'name' : 'about file options and nerdtree, fzf'}
    " let g:lmap.b = {'name' : 'about buffer and tab'}
    " let g:lmap.t = {'name' : 'about nerdtree and term'}
    " let g:lmap.c = {'name' : 'about comment'}
    " let g:lmap.o = {'name' : 'new blank line up'}
    " let g:lmap.O = {'name' : 'new blank line down'}
    " let g:topdict = {}
    " let g:topdict[' '] = g:lmap
    " let g:topdict[' ']['name'] = '<leader>'
    " call leaderGuide#register_prefix_descriptions("", "g:topdict")
    " nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
    " vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
    " let g:leaderGuide_hspace = 5
endfunction

function! g:CssCompleteConfig()
    " csscomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS nonci
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
endfunction

function! g:VimClosetagConfig()
    "vim-closetag

    " filenames like *.xml, *.html, *.xhtml, ...
    " These are the file extensions where this plugin is enabled.
    "
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

    " filenames like *.xml, *.xhtml, ...
    " This will make the list of non-closing tags self-closing in the specified files.
    "
    let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

    " filetypes like xml, html, xhtml, ...
    " These are the file types where this plugin is enabled.
    "
    let g:closetag_filetypes = 'html,xhtml,phtml,vue'

    " filetypes like xml, xhtml, ...
    " This will make the list of non-closing tags self-closing in the specified files.
    "
    let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue'

    " integer value [0|1]
    " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
    "
    let g:closetag_emptyTags_caseSensitive = 1

    " Shortcut for closing tags, default is '>'
    "
    let g:closetag_shortcut = '>'

    " Add > at current position without closing the current tag, default is ''
    "
    let g:closetag_close_shortcut = '<leader>>'
endfunction

function! g:PymodeConfig()
    " python-mode
    let g:pymode_python = 'python3'
    " let g:pymode_rope = 1
    " let g:pymode_rope_completion=1
    " let g:pymode_rope_autoimport = 1
    " let g:pymode_rope_autoimport = 1
    " let g:pymode_rope_completion_bind = '<Tab>'
    let g:pymode_run_bind = '<leader>r'
    " let g:pymode_rope_complete_on_dot=1
endfunction

function! g:VimRubyConfig()
    " vim-ruby
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
endfunction

function! g:SpaceVimDarkConfig()
    " space-vim-dark
    colorscheme space-vim-dark
    " set termguicolors
    " hi LineNr ctermbg=NONE guibg=NONE
endfunction

function! g:FZFConfig()
    " fzf
    function! s:fzf_statusline()
        " Override statusline as you like
        highlight fzf1 ctermfg=161 ctermbg=251
        highlight fzf2 ctermfg=23 ctermbg=251
        highlight fzf3 ctermfg=237 ctermbg=251
        setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction
    " let g:fzf_layout = { 'down': '~40%' }

    " In Neovim, you can set up fzf window using a Vim command
    " let g:fzf_layout = { 'window': 'enew' }
    " let g:fzf_layout = { 'window': '-tabnew' }
    " let g:fzf_layout = { 'window': '10split enew' }

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
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endfunction

function! g:WhichKeyConfig()
    " whcih key
    let g:which_key_sep = '➧ '
    let g:which_key_timeout=300
    let g:mapleader = "\<Space>"
    let g:maplocalleader = ','
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    " vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
    " nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
    " vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>
    let g:which_key_map = {}
    let g:which_key_hspace=4
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endfunction

function! g:NordVimConfig()
    " colorscheme nord
    " let g:nord_italic=1
    " let g:nord_italic_comments=1
    " let g:nord_comment_brightness=12
    " let g:nord_uniform_status_lines=1
endfunction

function! g:VimLspConfig()
    " if executable('clangd')
        " au User lsp_setup call lsp#register_server({
                    " \ 'name': 'clangd',
                    " \ 'cmd': {server_info->['clangd']},
                    " \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    " \ })
    " endif
    if executable('/mnt/D/github/cquery/build/cquery')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'cquery',
                    \ 'cmd': {server_info->['/mnt/D/github/cquery/build/cquery']},
                    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                    \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                    \ })
    endif
endfunction

function! g:ContextFiletypeConfig()
endfunction

function! g:CocConfig()
    let g:coc_global_extensions = [
                \ 'coc-tsserver',
                \ 'coc-explorer',
                \ 'coc-python',
                \ 'coc-vetur',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-solargraph',
                \ 'coc-json',
                \]
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    set hidden
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    set updatetime=200
    set shortmess+=c
    if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif
    autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
endfunction

function! g:JavaImpConfig()
    let g:JavaImpTopImports = [
                \ 'java\..*',
                \ 'javax\..*',
                \ 'org\..*',
                \ 'com\..*'
                \ ]
endfunction

function! g:VimOrganizerConfig()
     let g:org_command_for_emacsclient = "emacsclient"
    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
    au BufEnter *.org            call org#SetOrgFileType()
endfunction

function! g:NrrwRgnConfig()
  command! -nargs=* -bang -range -complete=filetype NN
              \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
              \ | set filetype=<args>
endfunction

function! g:VimNotesConfig()
    " let g:notes_directories=['/mnt/D/note/vim-note',]
    let g:notes_suffix='.txt'
    let g:notes_unicode_enabled=0
    let g:notes_smart_quotes=0
endfunction

function! g:VimOrgConfig()
    let g:org_agenda_files = ['/mnt/D/agenda/*.org']
endfunction

function! g:VimSyntaxRangeConfig()
    function! g:OrgSyntax()
        call SyntaxRange#Include('#+BEGIN_SRC java\n', '#END_SRC\n', 'java', 'NonText')
        call SyntaxRange#Include('#+BEGIN_SRC xml\n', '#END_SRC\n', 'xml', 'NonText')
    endfunction
    au BufNew,BufEnter *.org call g:OrgSyntax()
endfunction

function! g:BetterWhiteSpace()
    let g:better_whitespace_enabled = 0
endfunction

function! g:TagbarConfig()
    let g:tagbar_autofocus = 1
    let g:tagbar_show_linenumbers = 1
    let g:tagbar_singleclick = 1
    let g:tagbar_iconchars = ['▸', '▾']
endfunction

function! g:VisualMuliti()
    " let g:VM_check_mappings = 0
    " let g:VM_clear_buffer_hl = 0
    let g:VM_mouse_mappings = 1
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
endfunction

function! g:VistaConfig()
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    let g:vista#renderer#enable_icon = 1
    let g:vista#renderer#icons = {
                \   "function": "\uf794",
                \   "variable": "\uf71b",
                \  }
endfunction

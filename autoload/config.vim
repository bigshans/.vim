function! config#NERDTreeConfig()
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

function! config#AirlineConfig()
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
    let g:airline_theme='atomic'
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

function! config#YcmConfig()
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

function! config#Javacomplete2Config()
    "javacomplete2 config
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    let g:JavaComplete_UsePython3 = 1
endfunction

function! config#UltiSnipsConfig()
    let g:UltiSnipsExpandTrigger="<C-z>"
    let g:UltiSnipsJumpForwardTrigger="<C-b>"
    let g:UltiSnipsJumpBackwardTrigger="<C-z>"
    let g:UltiSnipsEditSplit="vertical"
endfunction

function! config#NERDCommenterConfig()
    "nerdcommenter config
    let g:NERDSpaceDelims=1
    " <leader>cc   加注释
    " <leader>cu   解开注释
endfunction

function! config#DelimitMateConfig()
    "delimitMate config
    " let g:delimitMate_expand_cr = 1
    let g:delimitMate_autoclose = 1
    let g:delimitMate_expand_space = 1
endfunction

function! config#IndentLineConfig()
    " indentLine config
    let g:indentLine_char = '┊'
    let g:indentLine_leadingSpaceChar = '·'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_color_tty_light = 7
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 1
    let g:vim_json_syntax_conceal = 1
    let g:indentLine_enabled = 1
    let g:indentLine_leadingSpaceEnable = 1
    let g:indentLine_fileTypeExclude = [ 'startify', 'coc-explorer', 'which_key', 'markdown', 'help', 'json', 'dashboard' ]
    fun! IndentLineStart()
        if &ft =~ join(g:indentLine_fileTypeExclude, '\|')
            execute('IndentLinesDisable')
            return
        endif
        execute('IndentLinesEnable')
    endfun
    autocmd BufEnter * call timer_start(200, { tid -> IndentLineStart()})
endfunction

function! config#StartifyConfig()
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

function! config#VimMulipleCursorsConfig()    
    "vim-mutliple-cursors
    highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    highlight link multiple_cursors_visual Visual
endfunction

function! config#VimRepl()    
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

function! config#AleConfig()
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

function! config#LanguageClientConfig()
    " LanguageClient
    let g:LanguageClient_autoStart=1
    let g:LanguageClient_serverCommands = {
                \ 'java':['/mnt/D/jdtl/jdtls'],
                \ }
endfunction

function! config#VimAutoformatConfig()
    "vim-autoformat
    let g:formatdef_my_custom_c="astyle --style=1tbs"
    let g:formatdef_yapf_style= 'pep8'
    let g:formatdef_nginx_style="nginxfmt -i 4"
endfunction

function! config#VimQuickrunConfig()
    "vim-quickrun
    let g:quickrun_config = {
                \ "_" : {
                \ "outputter" : "message",
                \},
                \}
    let g:quickrun_no_default_key_mappings = 1
endfunction

function! config#VimInterestingwordConfig()
endfunction

function! config#UndotreeConfig()
endfunction

function! config#RainbowParenthessConfig()
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

function! config#VimExpandRegionConfig()
    "vim-expand-region
    let g:expand_region_usr_select_mode = 1
endfunction

function! config#VimVueConfig()
    let g:vue_disable_pre_processors=1
endfunction

function! config#NERDTreeGitPluginConfig()
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

function! config#EasymotionConfig()
    let g:EasyMotion_do_mappings = 0
endfunction

function! config#VimDeviconsConfig()
    " vim-devicons
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
endfunction

function! config#VimFollowMyLeadConfig()
    " vim-follow-my-lead
    let g:fml_all_sources = 1
endfunction

function! config#CssCompleteConfig()
    " csscomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS nonci
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
endfunction

function! config#VimClosetagConfig()
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

function! config#VimRubyConfig()
    " vim-ruby
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
endfunction

function! config#SpaceVimDarkConfig()
    " space-vim-dark
    " colorscheme space-vim-dark
    " set termguicolors
    " hi LineNr ctermbg=NONE guibg=NONE
endfunction

function! config#FZFConfig()
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

function! config#WhichKeyConfig()
    " whcih key
    let g:which_key_sep = '➧ '
    let g:which_key_timeout=75
    let g:mapleader = "\<Space>"
    let g:maplocalleader = ','
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> [      :<c-u>WhichKey '['<CR>
    nnoremap <silent> ]      :<c-u>WhichKey ']'<CR>
    let g:which_key_map = {}
    let g:which_key_hspace=4
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endfunction

function! config#NordVimConfig()
    " colorscheme nord
    " let g:nord_italic=1
    " let g:nord_italic_comments=1
    " let g:nord_comment_brightness=12
    " let g:nord_uniform_status_lines=1
endfunction

function! config#ContextFiletypeConfig()
endfunction

function! config#CocConfig()
    let g:coc_global_extensions = [
                \ 'coc-explorer',
                \ 'coc-tsserver',
                \ 'coc-eslint',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-solargraph',
                \ 'coc-json',
                \ 'coc-rust-analyzer',
                \ 'coc-snippets',
                \ 'coc-metals',
                \ 'coc-deno',
                \ 'coc-svelte',
                \ 'coc-calc',
                \ 'coc-vimlsp',
                \ 'coc-toml',
                \ 'coc-xml',
                \ '@yaegassy/coc-volar',
                \ '@yaegassy/coc-intelephense',
                \ 'coc-marketplace',
                \ 'coc-translator',
                \ 'coc-tabnine',
                \ 'coc-ci',
                \ 'coc-highlight',
                \]
    set hidden
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
    " remap for complete to use tab and <cr>
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#pum#next(1):
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    " inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    inoremap <silent><expr> <c-space> coc#refresh()
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
        autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    augroup custom_nginx
        autocmd!
        autocmd FileType nginx setlocal iskeyword+=$
        autocmd FileType nginx let b:coc_additional_keywords = ['$']
    augroup end
    let g:trigger_size = 0.5 * 1048576
    augroup hugefile
        autocmd!
        autocmd BufReadPre *
                    \ let size = getfsize(expand(@%)) |
                    \ if (size > g:trigger_size) || (size == -2) |
                    \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
                    \   exec 'CocDisable' |
                    \ else |
                    \   exec 'CocEnable' |
                    \ endif |
                    \ unlet size
    augroup END
endfunction

function! config#VimOrganizerConfig()
     let g:org_command_for_emacsclient = "emacsclient"
    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
    au BufEnter *.org            call org#SetOrgFileType()
endfunction

function! config#NrrwRgnConfig()
  command! -nargs=* -bang -range -complete=filetype NN
              \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
              \ | set filetype=<args>
endfunction

function! config#VimNotesConfig()
    let g:notes_directories=['/projects/aerian/resource/nextcloud-back/vnote',]
    let g:notes_suffix='.txt'
    let g:notes_unicode_enabled=1
    let g:notes_smart_quotes=1
endfunction

function! config#VimOrgConfig()
    let g:org_agenda_files = ['/mnt/D/agenda/*.org']
endfunction

function! config#VimSyntaxRangeConfig()
    function! g:OrgSyntax()
        call SyntaxRange#Include('#+BEGIN_SRC java\n', '#END_SRC\n', 'java', 'NonText')
        call SyntaxRange#Include('#+BEGIN_SRC xml\n', '#END_SRC\n', 'xml', 'NonText')
    endfunction
    au BufNew,BufEnter *.org call g:OrgSyntax()
endfunction

function! config#BetterWhiteSpace()
    let g:better_whitespace_enabled = 0
endfunction

function! config#TagbarConfig()
    let g:tagbar_autofocus = 1
    let g:tagbar_show_linenumbers = 1
    let g:tagbar_singleclick = 1
    let g:tagbar_iconchars = ['▸', '▾']
endfunction

function! config#VisualMuliti()
    " let g:VM_check_mappings = 0
    " let g:VM_clear_buffer_hl = 0
    let g:VM_mouse_mappings = 1
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
endfunction

function! config#VistaConfig()
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

function! config#WorkSpace()
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
endfunction

function! config#MiniMapConfig()
    let g:minimap_with = 10
endfunction

function! config#ClapConfig()
  let g:clap_theme = 'material_design_dark'
endfunction

function! config#OnedarkConfig()
    "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
        if (has("nvim"))
            "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
        "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
        " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
        if (has("termguicolors"))
            set termguicolors
        endif
    endif
    syntax on
    colorscheme onedark
    let g:airline_theme='onedark'
endfunction

function! config#SpelunkerConfig()
    " Enable spelunker.vim. (default: 1)
    " 1: enable
    " 0: disable
    let g:enable_spelunker_vim = 1

    " Enable spelunker.vim on readonly files or buffer. (default: 0)
    " 1: enable
    " 0: disable
    let g:enable_spelunker_vim_on_readonly = 0

    " Check spelling for words longer than set characters. (default: 4)
    let g:spelunker_target_min_char_len = 4

    " Max amount of word suggestions. (default: 15)
    let g:spelunker_max_suggest_words = 15

    " Max amount of highlighted words in buffer. (default: 100)
    let g:spelunker_max_hi_words_each_buf = 100

    " Spellcheck type: (default: 1)
    " 1: File is checked for spelling mistakes when opening and saving. This
    " may take a bit of time on large files.
    " 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
    " depends on the setting of CursorHold `set updatetime=1000`.
    let g:spelunker_check_type = 1

    " Highlight type: (default: 1)
    " 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
    " 2: Highlight only SpellBad.
    " FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
    let g:spelunker_highlight_type = 1

    " Option to disable word checking.
    " Disable URI checking. (default: 0)
    let g:spelunker_disable_uri_checking = 1

    " Disable email-like words checking. (default: 0)
    let g:spelunker_disable_email_checking = 1

    " Disable account name checking, e.g. @foobar, foobar@. (default: 0)
    " NOTE: Spell checking is also disabled for JAVA annotations.
    let g:spelunker_disable_account_name_checking = 1

    " Disable acronym checking. (default: 0)
    let g:spelunker_disable_acronym_checking = 1

    " Disable checking words in backtick/backquote. (default: 0)
    let g:spelunker_disable_backquoted_checking = 1

    " Disable default autogroup. (default: 0)
    let g:spelunker_disable_auto_group = 1

    " Create own custom autogroup to enable spelunker.vim for specific filetypes.
    augroup spelunker
        autocmd!
        " Setting for g:spelunker_check_type = 1:
        autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

        " Setting for g:spelunker_check_type = 2:
        autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
    augroup END

    " Override highlight group name of incorrectly spelled words. (default:
    " 'SpelunkerSpellBad')
    let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

    " Override highlight group name of complex or compound words. (default:
    " 'SpelunkerComplexOrCompoundWord')
    let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

    " Override highlight setting.
    autocmd ColorScheme *
                \ highlight SpelunkerSpellBad cterm=undercurl ctermfg=247 gui=undercurl guifg=#9e9e9e |
                \ highlight SpelunkerComplexOrCompoundWord cterm=undercurl ctermfg=NONE gui=undercurl guifg=NONE
endfunction

function! config#CamelCaseMotion()
    let g:camelcasemotion_key = 's'
    omap <silent> sie <Plug>CamelCaseMotion_iw
    xmap <silent> sie <Plug>CamelCaseMotion_iw
    omap <silent> sib <Plug>CamelCaseMotion_ib
    xmap <silent> sib <Plug>CamelCaseMotion_ib
    omap <silent> siw <Plug>CamelCaseMotion_ie
    xmap <silent> siw <Plug>CamelCaseMotion_ie
endfunction

function! config#VimMarkdownConfig()
    let g:vim_markdown_folding_disabled = 0
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_conceal = 0
    let g:tex_conceal = ""
    let g:vim_markdown_math = 1
    let g:vim_markdown_fenced_languaghes = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'zsh=sh', 'shell=sh']
    let g:vim_markdown_strikthrough = 1
endfunction

function! config#EmmetConfig()
    let g:user_emmet_settings = {
                \ 'wxss': {
                    \   'extends': 'css',
                    \ },
                    \ 'wxml': {
                        \   'extends': 'html',
                        \   'aliases': {
                            \     'div': 'view',
                            \     'span': 'text',
                            \   },
                            \  'default_attributes': {
                                \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
                                \     'navigator': [{'url': '', 'redirect': 'false'}],
                                \     'scroll-view': [{'bindscroll': ''}],
                                \     'swiper': [{'autoplay': 'false', 'current': '0'}],
                                \     'icon': [{'type': 'success', 'size': '23'}],
                                \     'progress': [{'precent': '0'}],
                                \     'button': [{'size': 'default'}],
                                \     'checkbox-group': [{'bindchange': ''}],
                                \     'checkbox': [{'value': '', 'checked': ''}],
                                \     'form': [{'bindsubmit': ''}],
                                \     'input': [{'type': 'text'}],
                                \     'label': [{'for': ''}],
                                \     'picker': [{'bindchange': ''}],
                                \     'radio-group': [{'bindchange': ''}],
                                \     'radio': [{'checked': ''}],
                                \     'switch': [{'checked': ''}],
                                \     'slider': [{'value': ''}],
                                \     'action-sheet': [{'bindchange': ''}],
                                \     'modal': [{'title': ''}],
                                \     'loading': [{'bindchange': ''}],
                                \     'toast': [{'duration': '1500'}],
                                \     'audio': [{'src': ''}],
                                \     'video': [{'src': ''}],
                                \     'image': [{'src': '', 'mode': 'scaleToFill'}],
                                \   }
                                \ },
                                \}
endfunction

function! config#Wildfire()
    let g:wildfire_objects = {
                \ "*" : ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "it"]
                \ }

    call wildfire#triggers#Add("<ENTER>", {
                \ "html,xml" : ["it", "at"],
                \ })
endfunction

function! config#Lightline()
    let g:lightline = { 'enable': { 'tabline': 0 } }
    let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
    let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
    let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
    let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
    let g:lightline#asyncrun#indicator_none = ''
    let g:lightline#asyncrun#indicator_run = 'Running...'
    if g:vim_lightline_artify == 0
        let g:lightline.active = {
                    \ 'left': [ [ 'mode', 'winnr', 'paste', 'readonly' ],
                    \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
                    \ 'right': [
                        \ [ 'lineinfo' ],
                    \            [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
                    \           [ 'asyncrun_status', 'coc_status' ],
                    \ ]
                    \ }
        let g:lightline.inactive = {
                    \ 'left': [ [ 'filename', 'winnr' , 'modified', 'fileformat', 'devicons_filetype' ]],
                    \ 'right': [ ['lineinfo',  'git_global' ] ]
                    \ }
        " let g:lightline.tabline = {
                    " \ 'left': [ [ 'vim_logo', 'close', 'tabs' ] ],
                    " \ 'right': [ [ 'git_global' ], ['git_buffer'],
                    " \  ]
                    " \ }
        " let g:lightline.tab = {
                    " \ 'active': [ 'tabnum', 'filename', 'modified' ],
                    " \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
    else
        let g:lightline.active = {
                    \ 'left': [ [ 'artify_mode', 'winnr', 'paste', 'readonly' ],
                    \           ['filename', 'modified', 'fileformat', 'devicons_filetype' ]],
                    \ 'right': [
                        \ [ 'artify_lineinfo' ],
                    \            [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
                    \           [ 'asyncrun_status', 'coc_status' ],
                        \ [ 'git_global' ],
                    \ ]
                    \ }
        let g:lightline.inactive = {
                    \ 'left': [ [ 'filename', 'winnr' , 'modified', 'fileformat', 'devicons_filetype' ]],
                    \ 'right': [ ['artify_lineinfo',   'git_global' ] ]
                    \ }
        " let g:lightline.tabline = {
                    " \ 'left': [ [ 'vim_logo', 'close', 'tabs' ] ],
                    " \ 'right': [ [ 'git_global' ], ['git_buffer'],
                    " \ ]
                    " \ }
        " let g:lightline.tab = {
                    " \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
                    " \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
    endif
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
                \ 'coc_status': 'custom#lightline#coc_status'
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
endfunction

function! config#Sonokai()
    " Important!!
    if has('termguicolors')
        set termguicolors
    endif
    " The configuration options should be placed before `colorscheme sonokai`.
    let g:sonokai_style = 'atlantis'
    let g:sonokai_enable_italic = 1
    let g:sonokai_disable_italic_comment = 1
endfunction

function! config#BetterEscape()
    " use jj to escape insert mode.
    let g:better_escape_shortcut = 'jk'
    let g:better_escape_interval = 10
endfunction

function! config#Sandwich()
    let g:sandwich#recipes = [
	  \   {'buns': ['“', '”'],  'nesting': 1, 'input': ['c"']},
      \   {'buns': ['‘', '’'],  'nesting': 1, 'input': ["c'"]},
      \   {'buns': ['${', '}'], 'nesting': 1, 'input': ['bs']},
      \   {'buns': ['{', '}'], 'nesting': 1, 'input': ['{']},
      \ ]
    call extend(g:sandwich#recipes, g:sandwich#default_recipes)
    nmap srt <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)tt
endfunction

function! config#CodeRunnerConfig()
    let g:CodeRunnerCommandMap = {
                \ 'typescript': 'ts-node $filePath'
                \ }
    let g:code_runner_save_before_execute = 1
endfunction

function! config#AutoPairsConfig()
endfunction

function! config#RelConfig()
    let g:rel_extmap = {
                \ 'html': '$BROWSER %s'
                \ }
    let g:rel_http = '$BROWSER %s'
endfunction

function! config#FastFoldConfig()
    let g:html_folding = 1
endfunction

function! config#Dashboard()
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_custom_section = {
    \ 'b'         :{
          \ 'description': [' Open last session                     SPC s l'],
          \ 'command':function('dashboard#handler#last_session')},
    \ 'c'   :{
          \ 'description': [' Open org-agenda                       SPC o A'],
          \ 'command': 'lua require("orgmode").action("agenda.prompt")'},
    \ 'd'         :{
          \ 'description': [' Recently opened files                 SPC f r'],
          \ 'command':function('dashboard#handler#find_history')},
    \ 'e'         :{
          \ 'description': [' Open file                             SPC f f'],
          \ 'command': 'Findr'},
    \ 'f'   :{
          \ 'description': [' Open plugin list                      SPC o p'],
          \ 'command': 'edit $HOME/.vim/config/plugin_config.vim'},
    \ 'g'   :{
          \ 'description': [' Plugin update                         SPC P p'],
          \ 'command': 'PlugUpdate'},
    \ 'h'   :{
          \ 'description': [' Plugin install                        SPC P i'],
          \ 'command': 'PlugInstall'},
    \ 'i'   :{
          \ 'description': [' Change colorScheme                    SPC s C'],
          \ 'command':function('dashboard#handler#change_colorscheme')},
    \ }
    source $HOME/.vim/config/logo.vim
    if exists('g:aerian_s_vim_logo')
        let g:dashboard_custom_header = g:aerian_s_vim_logo[Rand()%len(g:aerian_s_vim_logo)]
    endif
    let g:dashboard_custom_footer = ['type e to new a buffer or type q to exit']
    let g:dashboard_session_directory = $HOME . '/.cache/vim-session'
    function SetTabline() abort
        if &ft =~ 'dashboard'
            set showtabline=0
        else
            if &showtabline != 2
                set showtabline=2
            endif
        endif
    endfunction
    autocmd FileType dashboard nnoremap <silent><buffer>e :call dashboard#handler#new_file()<CR> | nmap <buffer>q :qa!<CR>
    autocmd BufEnter,FileType * call SetTabline()
endfunction

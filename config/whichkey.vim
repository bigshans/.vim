function! g:WhichLeaderKeyMap()
    let g:which_key_map.f=FileKey()
    let g:which_key_map.s=SearchKey()
    let g:which_key_map.w=WindowsKey()
    let g:which_key_map.c=CommentKey()
    let g:which_key_map.b=BuffersKey()
    let g:which_key_map.t=TagKeyMap()
    let g:which_key_map.P=PluginKey()
    let g:which_key_map.e=EditKey()
    let g:which_key_map.a=ApplicationKey()
    let g:which_key_map.u=UndoKey()
    let g:which_key_map.o=OpenKey()
    let g:which_key_map.h=BetterKey()
    let g:which_key_map.p='system paste'
    let g:which_key_map.y='system copy'
    let g:which_key_map.q='quit without save'
    let g:which_key_map.Q='quit all'
    let g:which_key_map.i=MuiltipleKey()
    let g:which_key_map.g=GitKey()
    let g:which_key_map.j=CoCKey()
    let g:which_key_map.t=TabKey()
    let g:which_key_map['?']='search key'
    let g:which_key_map[';']='bottom command'
    let g:which_key_map['<CR>']='blank line to up'
    let g:which_key_map.S=WorkSpaceKey()
    let g:which_key_map.C=SpellCheck()
    call which_key#register('<Space>', "g:which_key_map")
endfunction

function! g:UnimpairedMapping()
    if g:vim_basic != 1
        nmap [a     :previous<CR>
        nmap ]a     :next<CR>
        nmap [A     :first<CR>
        nmap ]A     :last<CR>
        nmap [b     :bprevious<CR>
        nmap ]b     :bnext<CR>
        nmap [B     :bfirst<CR>
        nmap ]B     :blast<CR>
        nmap [l     :lprevious<CR>
        nmap ]l     :lnext<CR>
        nmap [L     :lfirst<CR>
        nmap ]L     :llast<CR>
        nmap [<C-L> :lpfile<CR>
        nmap ]<C-L> :lnfile<CR>
        nmap [q     :cprevious<CR>
        nmap ]q     :cnext<CR>
        nmap [Q     :cfirst<CR>
        nmap ]Q     :clast<CR>
        nmap [<C-Q> :cpfile<CR>
        nmap ]<C-Q> :cnfile
        nmap [t     :tprevious<CR>
        nmap ]t     :tnext<CR>
        nmap [T     :tfirst<CR>
        nmap ]T     :tlast<CR>
        nmap [<C-T> :ptprevious<CR>
        nmap ]<C-T> :ptnext<CR>
    endif
    nmap [n :tabprevious<CR>
    nmap ]n :tabnext<CR>
    let g:unimpaired_key_map={
                \ 'a': 'previous',
                \ 'A': 'first',
                \ 'b': 'bprevious',
                \ 'B': 'bfirst',
                \ 'l': 'lprevious',
                \ 'L': 'lfirst',
                \ '<C-L': 'lpfile',
                \ 'q': 'cprevious',
                \ 'Q': 'cfirst',
                \ '<C-Q>': 'cpfile',
                \ 't': 'tprevious',
                \ 'T': 'tfirst',
                \ '<C-T>': 'ptprevious',
                \ '<Space>': 'add blank above the cursour',
                \ 'e': 'Exchange the current line with n lines above it.',
                \ 'n': 'tab previous',
                \ }
    call which_key#register('[', 'g:unimpaired_key_map')
    let g:unimpaired_key_map_convert={
                \ 'a': 'next',
                \ 'A': 'last',
                \ 'b': 'bnext',
                \ 'B': 'blast',
                \ 'l': 'lnext',
                \ 'L': 'llast',
                \ '<C-L': 'lnfile',
                \ 'q': 'cnext',
                \ 'Q': 'clast',
                \ '<C-Q>': 'cnfile',
                \ 't': 'tnext',
                \ 'T': 'tlast',
                \ '<C-T>': 'ptnext',
                \ '<Space>': 'add blank below the cursour',
                \ 'e': 'Exchange the current line with n lines below it.',
                \ 'n': 'tab next',
                \ }
    call which_key#register(']', 'g:unimpaired_key_map_convert')
endfunction

function! g:TagKeyMap()
    nmap <leader>vt :Vista!!<CR>
    nmap <leader>vc :Vista coc<CR>
    return {
                \ 'name': '+Vista',
                \ 't': 'show tag',
                \ 'c' : 'lsp tag',
                \}
endfunction

function! CoCKey()
    nnoremap <leader>jR :CocRestart<CR>
    nmap <leader>jq  <Plug>(coc-fix-current)
    nmap <leader>jf :CocFix<CR>
    nmap <silent><leader>jjt <Plug>(coc-type-definition)
    nmap <silent><leader>jjf <Plug>(coc-implementation)
    nmap <silent><leader>jjr <Plug>(coc-references)
    nnoremap <silent><leader>jk :call <SID>show_documentation()<CR>
    nmap <leader>jr <Plug>(coc-rename)
    nmap <leader>ja <Plug>(coc-codeaction)
    return {
                \ 'name': '+Coc',
                \ 'R': 'Coc server  restart',
                \ 'f': 'Coc Fix it',
                \ 'q': 'Coc Quickly Fix it',
                \ 'j': {
                    \ 'name': '+Goto',
                    \ 't': 'Coc GottoTypeDefinition',
                    \ 'f': 'Coc implementtation',
                    \ 'r': 'Coc references',
                    \ },
                    \ 'k': 'Coc show_documentation',
                    \ 'r': 'Coc Rename',
                    \ 'a': 'Coc GotoDefinition',
                    \}
endfunction
function! GitKey()
    nnoremap <leader>ga :Git add %<CR>
    nnoremap <leader>gr :Git restore %<CR>
    nnoremap <leader>gc :Git commit<CR>
    nnoremap <leader>gs :Git<CR>
    return {
                \ 'name':'+git',
                \ 'a': 'add current file',
                \ 'r': 'recover current file',
                \ 'c': 'commit',
                \ 's': 'status'
                \ }
endfunction

function! OpenKey()
    nnoremap <leader>op :tabnew $HOME/.vim/config/plugin_config.vim<CR>
    nnoremap <leader>ok :tabnew $HOME/.vim/config/whichkey.vim<CR>
    nnoremap <leader>ob :tabnew $HOME/.vim/config/basic.vim<CR>
    nnoremap <leader>oc :tabnew $HOME/.vim/autoload/config.vim<CR>
    nnoremap <leader>oC :tabnew $HOME/.vim/coc-settings.json<CR>
    nnoremap <leader>ov :tabnew $HOME/.vim/vimrc<CR>
    nnoremap <leader>ot :call TermToggle(12)<CR>
    nnoremap <silent><leader>of :<C-u>Clap filer<CR>
    nmap <silent><leader>oo :call g:XdgOpen('.')<CR>
    return {
                \ 'name': '+open...',
                \ 'p': 'open plugin file',
                \ 'k': 'open key config file',
                \ 'c': 'open config plugin file',
                \ 'b': 'open basic config file',
                \ 'v': 'open vim init file',
                \ 'f': 'open files',
                \ 't': 'open terminal',
                \ 'o': 'open folder external',
                \ }
endfunction

function! BetterKey()
    nnoremap <silent><leader>hm :message<CR>
    nnoremap <leader>hfb :Bigger<CR>
    nnoremap <leader>hfm :Smaller<CR>
    nnoremap <leader>hh :Clap help_tags<CR>
    nnoremap <leader>ht :help<Space>
    xnoremap <silent><leader>hr :set relativenumber!<CR>
    nnoremap <silent><leader>hn :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
    return {
                \ 'name': 'better keybind',
                \ 'r': 'relative line number',
                \ 'n': 'no hightlight',
                \ 'm': 'show messages',
                \ 'h': 'helptags',
                \ 't': 'help command',
                \ 'f': {
                \ 'name': '+fonts',
                \ 'b': 'bigger fonts',
                \ 'm': 'smaller fonts',
                \ }
                \ }
endfunction

function! WindowsKey()
    for s:i in range(1, 9)
        " <Leader>[1-9] move to window [1-9]
        execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
        let g:which_key_map[s:i]='to windows '.s:i
    endfor
    let g:which_key_map['<Up>']='win expand up'
    let g:which_key_map['<Down>']='win expand down'
    let g:which_key_map['<Left>']='win expand left'
    let g:which_key_map['<Right>']='win expand right'
    nnoremap <leader>wc :ChooseWin<CR>
    nnoremap <leader>wa :ChooseWinSwap<CR>
    nnoremap <leader>wd :only<CR>
    nnoremap <leader>wh <C-w><C-h>
    nnoremap <leader>wj <C-w><C-j>
    nnoremap <leader>wk <C-w><C-k>
    nnoremap <leader>wl <C-w><C-l>
    nnoremap <leader>ws :split<CR>
    nnoremap <leader>wv :vsplit<CR>
    nnoremap <leader>wo :only<CR>
    return {
                \ 'name':'+windows',
                \ 'c': 'choose win',
                \ 'd': 'only win',
                \ 'h': 'move left',
                \ 'j': 'move down',
                \ 'k': 'move up',
                \ 'l': 'move right',
                \ 's': 'split window',
                \ 'v': 'vertical split',
                \ 'a': 'choosewin swap',
                \ 'o': 'only current windows'
                \ }
endfunction

fun! g:XdgOpen(path) abort
    call system(printf('xdg-open %s &', shellescape(a:path)))
endfun

function! FileKey()
    nnoremap <leader>fs  :w!<CR>
    nnoremap <silent><leader>fr  :source $MYVIMRC<CR>
    nnoremap <leader>fS  :W<CR>
    nnoremap <silent><leader>ft :CocCommand explorer --preset<CR>
    nnoremap <leader>ff :History<CR>
    " Formatting selected code.
    xmap <leader>fm  <Plug>(coc-format-selected)
    nmap <silent><leader>fm  :call CocActionAsync('format')<CR>
    return {
                \ 'name': '+files',
                \ 's': 'save file',
                \ 'r': 'reload vim file',
                \ 'S': 'sudo save',
                \ 't': 'explorer toggle',
                \ 'f': 'recent files',
                \ 'm': 'format code',
                \ }
endfunction

function! PluginKey()
    nnoremap <leader>Pi  :PlugInstall<CR>
    nnoremap <leader>Pc  :PlugClean<CR>
    nnoremap <leader>Pp  :PlugUpdate<CR>
    return {
                \ 'name':'+Plugins',
                \ 'i':'plugin install',
                \ 'c':'plugin clean',
                \ 'p':'plugin update'
                \ }
endfunction

function! BuffersKey()
    nnoremap <leader>bs  :Startify<CR>
    nnoremap <silent><leader>bn  :bn<CR>
    nnoremap <silent><leader>bp  :bp<CR>
    nnoremap <silent><leader>bd  :bd<CR>
    nnoremap <silent><leader>bb  :Clap buffers<CR>
    return {
                \ 'name': '+Buffers',
                \ 's': 'start buffer',
                \ 'n': 'next buffer',
                \ 'p': 'pervious buffer',
                \ 'b': 'buffer search',
                \ 'd': 'buffer kill',
                \ }
endfunction

function! CommentKey()
    return {
                \ 'name':'+comment',
                \ }
endfunction

function! EditKey()
    "UltiSnips config
    " let g:UltiSnipsExpandTrigger="<C-z>"
    " let g:UltiSnipsJumpForwardTrigger="<C-f>"
    " let g:UltiSnipsJumpBackwardTrgger="<C-b>"
    " let g:UltiSnipsListSnippets="<Space>eul"
    nnoremap <leader>ef  :Autoformat<CR>
    vnoremap <leader>ef  :Autoformat<CR>
    nnoremap <leader>ea  ggVG
    nnoremap <leader>eus  :Snippets<CR>
    return {
                \ 'name': '+edit',
                \ 'f': 'format code',
                \ 'a': 'select all',
                \ 'u': {
                \ 'name': '+ultisnips',
                \ 'l': 'list snippets',
                \ 's': 'search avaliable snippets'
                \ }
                \ }
endfunction

function! ApplicationKey()
    nnoremap <leader>aii  :call InterestingWords('n')"<CR>
    nnoremap <leader>aiu :call UncolorAllWords()<CR>
    nnoremap <leader>aip :call WordNavigation('forward')<CR>
    nnoremap <leader>ain :call WordNavigation('backword')<CR>
    nnoremap <silent><leader>aqr :QuickRun -mode n<CR>
    nnoremap <silent><F5> :QuickRun -mode n<CR>
    vnoremap <silent><F5> :QuickRun -mode v<CR>
    vnoremap <silent><leader>aqr :QuickRun -mode v<CR>
    nnoremap <leader>at :Vista!!<CR>
    nnoremap <leader>az :Goyo<CR>
    nnoremap <leader>ad :IciFrom<CR>
    nnoremap <leader>ale :IndentLinesEnable<CR>
    nnoremap <leader>ald :IndentLinesDisable<CR>
    nnoremap <leader>all :IndentLinesToggle<CR>
    nnoremap <leader>apa :CocCommand addProject<CR>
    nnoremap <leader>apr :CocCommand removeProject<CR>
    nnoremap <leader>apl :CocList projectors<CR>
    nmap <leader>af :CocFix<CR>
    return {
                \ 'name': '+applications',
                \ 'f': 'Fixed Code',
                \ 'i': {
                \ 'name':'+intertingword',
                \ 'i': 'colored the word',
                \ 'u': 'uncolor all word',
                \ 'p': 'forward',
                \ 'n': 'backward',
                \ },
                \ 'q': {
                \ 'name': '+quickrun',
                \ 'r':'run code',
                \ },
                \ 't': {
                \ 'name': 'vista',
                \ },
                \ 'z': 'vim zenroom2',
                \ 'd': 'word means',
                \ 'l': {
                \ 'name': '+indentLine',
                \ 'e': 'enable indentLine',
                \ 'd': 'disable indentLine',
                \ 'l': 'toggle indentline',
                \ },
                \ 'p': {
                    \ 'name': '+project',
                    \ 'a': 'add project',
                    \ 'r': 'remove project',
                    \ 'l': 'list project',
                    \ },
                \ }
endfunction

function! UndoKey()
    nnoremap <leader>uu :UndotreeToggle<CR>
    return {
                \ 'name': '+undotree',
                \ 'u':['UndotreeToggle', 'undotree show'],
                \}
endfunction

function! SearchKey()
    nnoremap <leader>sf :Clap files<CR>
    nnoremap <leader>ss :Clap blines<CR>
    nnoremap <leader>sb :Clap buffers<CR>
    nnoremap <leader>sC :Clap command<CR>
    nnoremap <leader>sc :Clap command<CR>
    nnoremap <leader>sw :Clap windows<CR>
    nnoremap <leader>sa :Clap grep<CR>
    nnoremap <leader>st :Clap tags<CR>
    nnoremap <leader>sq :wq<CR>
    return {
                \ 'name': '+search',
                \ 'a': 'ack search',
                \ 'f': 'find files',
                \ 's': 'search lines',
                \ 'b': 'search buffers',
                \ 'C': 'search color theme',
                \ 'c': 'search commands',
                \ 'w': 'search windows',
                \ 't': 'search tags',
                \ 'h' : {
                \ 'name': '+history',
                \ 'h': 'recent files',
                \ 'c': 'command history'
                \ },
                \ 'q' : 'save and quit',
                \ }
endfunction

function! MovtionKey()
    " Move to one char
    nmap f <Plug>(easymotion-f)
    nmap F <Plug>(easymotion-F)
    " Move to {char}{char}
    nmap mf <Plug>(easymotion-overwin-f2)

    " Move to line
    nmap ml <Plug>(easymotion-bd-jk)

    " Move to word
    nmap mw <Plug>(easymotion-bd-w)

    " Repeat
    nmap m. <Plug>(easymotion-repeat)

    " Gif config
    map  <M-/> <Plug>(easymotion-sn)
    omap <M-/> <Plug>(easymotion-tn)
endfunction

function! MuiltipleKey()
    let g:multi_cursor_use_default_mapping=0

    " Default mapping
    let g:multi_cursor_start_word_key      = '<Space>is'
    let g:multi_cursor_select_all_word_key = '<Space>ia'
    let g:multi_cursor_start_key           = '<Space>ie'
    let g:multi_cursor_select_all_key      = '<C-S-n>'
    let g:multi_cursor_next_key            = '<C-n>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'
    nnoremap <leader>in :IndentLinesToggle<CR>
    return {
                \ 'name': '+multiple cursors',
                \ 's': 'start word',
                \ 'e': 'start multiple',
                \ 'a': 'select all word',
                \ 'n': 'toggle indentLine'
                \ }
endfunction

function! WorkSpaceKey()
    nnoremap <leader>Ss :SessionSave<CR>
    nnoremap <leader>So :SessionOpenLast<CR>
    nnoremap <leader>Sl :SessionList<CR>
    return {
                \ 'name' : 'session',
                \ 's' : 'save session',
                \ 'o' : 'open last session',
                \ 'l' : 'open session list',
                \ }
endfunction

function! TabKey()
  noremap <leader>tn :tabn<CR>
  noremap <leader>tp :tabp<CR>
  noremap <leader>tc :tabclose<CR>
  noremap <leader>tw :tabnew<CR>
  noremap <leader>ta :tab ball<CR>
  return {
        \ 'name': 'tab',
        \ 'n' : 'next tab',
        \ 'p' : 'prev tab',
        \ 'c' : 'close tab',
        \ 'w' : 'new tab',
        \ 'a' : 'buffers to tab',
        \ }
endfunction

function! SpellCheck()
    nmap <leader>Cl Zl
    nmap <leader>Cc Zc
    nmap <leader>Cf Zf
    nmap <leader>Cg Zg
    nmap <leader>CG ZG
    return {
            \ 'name': 'spell check',
            \ 'l': 'Correct misspelled words with a list of suggestions.',
            \ 'c': 'Correct misspelled words by inserting a correction.',
            \ 'f': 'Correct misspelled words by picking first item on suggestion list. ',
            \ 'g': 'Add Select word to spellfile',
            \ 'G': 'Add Select word to the internal word list',
            \ }
endfunction

function! OtherKey()
    if has('nvim')
        nmap <silent><C-M-n> <plug>CodeRunner
    else
        nmap <silent><leader>R <plug>CodeRunner
    endif
    nmap <leader>/ <plug>(fzf-maps-n)
    xmap <leader>/ <plug>(fzf-maps-x)
    omap <leader>/ <plug>(fzf-maps-o)
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    nmap T <Plug>(coc-translator-p)
    vmap T <Plug>(coc-translator-pv)
    augroup Myfzf
        autocmd! FileType fzf tnoremap <buffer> <Esc> <C-g>
    augroup END
    if exists("*expand_region#custom_text_objects")
        call expand_region#custom_text_objects({
                    \ "\/\\n\\n\<CR>": 1,
                    \ 'a]' :1, 'ab' :1, 'aB' :1, 'a"' :1, 'a''': 1,
                    \ 'ii' :0, 'ai' :0,
                    \ 'ic' :0, 'ac' :0,
                    \ })
    endif
    vmap K <Plug>(expand_region_expand)
    vmap J <Plug>(expand_region_shrink)
    imap   <C-y>   <plug>(emmet-expand-abbr)
    imap   <C-y>;   <plug>(emmet-expand-word)
    imap   <C-y>u   <plug>(emmet-update-tag)
    imap   <C-y>d   <plug>(emmet-balance-tag-inward)
    imap   <C-y>D   <plug>(emmet-balance-tag-outward)
    imap   <C-y>n   <plug>(emmet-move-next)
    imap   <C-y>N   <plug>(emmet-move-prev)
    imap   <C-y>i   <plug>(emmet-image-size)
    imap   <C-y>/   <plug>(emmet-toggle-comment)
    imap   <C-y>j   <plug>(emmet-split-join-tag)
    imap   <C-y>k   <plug>(emmet-remove-tag)
    imap   <C-y>a   <plug>(emmet-anchorize-url)
    imap   <C-y>A   <plug>(emmet-anchorize-summary)
    imap   <C-y>m   <plug>(emmet-merge-lines)
    imap   <C-y>c   <plug>(emmet-code-pretty)
    nmap <silent> gd <Plug>(coc-definition)
    " nmap <silent> <C-]> <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocActionAsync('doHover')
        endif
    endfunction
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
    nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)
    nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)
    nmap <silent> <C-w> <Plug>TranslateW
    vmap <silent> <C-w> <Plug>TranslateWV
    imap <C-z> <Plug>(coc-snippets-expand)
    let g:coc_snippet_next = '<C-j>'
    let g:coc_snippet_prev = '<C-k>'
    imap <C-j> <Plug>(coc-snippets-expand-jump)
    xmap <leader>x  <Plug>(coc-convert-snippet)
	nmap s <Nop>
	xmap s <Nop>
    " For wildfire
    " This selects the next closest text object.
    map ; <Plug>(wildfire-fuel)
    " This selects the previous closest text object.
    vmap ; <Plug>(wildfire-water)
    nnoremap <M-x> :Commands<CR>
    call MovtionKey()
    call BasicVimKeybinding()
endfunction

function BasicVimKeybinding()
    call g:UnimpairedMapping()
    nnoremap J gJ
    nnoremap gp `[v`]
    nnoremap < <<
    nnoremap > >>
    inoremap <C-e> <End>
    inoremap <C-a> <Esc>I
    " Tab Key {{
    call TabKey()
    nn <M-1> 1gt
    nn <M-2> 2gt
    nn <M-3> 3gt
    nn <M-4> 4gt
    nn <M-5> 5gt
    nn <M-6> 6gt
    nn <M-7> 7gt
    nn <M-8> 8gt
    nn <M-9> 9gt
    nn <M-0> :tablast<CR>
    nn <leader>t1 1gt
    nn <leader>t2 2gt
    nn <leader>t3 3gt
    nn <leader>t4 4gt
    nn <leader>t5 5gt
    nn <leader>t6 6gt
    nn <leader>t7 7gt
    nn <leader>t8 8gt
    nn <leader>t9 9gt
    nn <leader>t0 :tablast<CR>
    " }}
    nnoremap <silent><C-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
    nnoremap <silent><C-Down>  :<c-u>execute 'move +'. v:count1<cr>
    inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
    inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
    vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
    vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
    vnoremap <silent>gy :call functions#CompleteYank()<CR>

    " Terminal Function {{
    let g:term_buf = 0
    let g:term_win = 0
    function! TermToggle(height)
        if win_gotoid(g:term_win)
            hide
        else
            botright new
            exec "resize " . a:height
            try
                exec "buffer " . g:term_buf
            catch
                call termopen($SHELL, {"detach": 0})
                let g:term_buf = bufnr("")
                set nonumber
                set norelativenumber
                set signcolumn=no
            endtry
            startinsert!
            let g:term_win = win_getid()
        endif
    endfunction
    " }}
    " For Terminal For Basic {{
    nnoremap <silent><A-t> :call TermToggle(12)<CR>
    inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
    tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap <ESC> <C-\><C-n>
    tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap :q! <C-\><C-n>:q!<CR>
    " }}
    nnoremap <silent><leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
    nnoremap <silent><CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent><leader><Up> :res -1<CR>
    nnoremap <silent><leader><Down> :res +1<CR>
    nnoremap <silent><leader><Left> :vertical res -1<CR>
    nnoremap <silent><leader><Right> :vertical res +1<CR>
    nnoremap wh <C-w><C-h>
    nnoremap wj <C-w><C-j>
    nnoremap wk <C-w><C-k>
    nnoremap wl <C-w><C-l>
    inoremap <S-Up> <Up>
    inoremap <S-Down> <Down>
    nnoremap <S-Up> k
    nnoremap <S-Down> j
    noremap j gj
    noremap k gk
    noremap <Up> gk
    noremap <Down> gj
    inoremap <silent> <expr> <Up> pumvisible() ? '<Up>' : functions#Close_fcitx('<C-o>gk')
    inoremap <silent> <expr> <Down> pumvisible() ? '<Down>' : functions#Close_fcitx('<C-o>gj')
    inoremap <silent> <expr> <M-Backspace> functions#Close_fcitx('<C-o>diw')
    nnoremap <leader>; :
    nmap <leader>q :q!<CR>
    nmap <leader>Q :qa!<CR>
    nnoremap sy "+y
    xnoremap sy "+y
    xnoremap sp "+p
    nnoremap sp "+p
    nnoremap <leader>y "+y
    xnoremap <leader>y "+y
    xnoremap <leader>p "+p
    nnoremap <leader>p "+p
    " Emacs like keybindings {{
    imap <C-n> <Down>
    imap <C-p> <Up>
    inoremap <C-b> <Left>
    inoremap <C-f> <Right>
    inoremap <A-f> <C-Right>
    inoremap <A-b> <C-Left>
    " }}
    imap <M-j><M-k> <Esc>
    imap <C-j><C-k> <Esc>
endfunction

if g:vim_basic == 1
    call g:WhichLeaderKeyMap()
    call OtherKey()
else
    call BasicVimKeybinding()
endif

function! g:WhichKeyMap()
    let g:which_key_map.f=FileKey()
    let g:which_key_map.s=SearchKey()
    let g:which_key_map.w=WindowsKey()
    let g:which_key_map.c=CommentKey()
    let g:which_key_map.b=BuffersKey()
    let g:which_key_map.d=DebugMap()
    " let g:which_key_map.t=NERDTreeKey()
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
    let g:which_key_map.l=AleKey()
    let g:which_key_map.m=MovtionKey()
    let g:which_key_map.i=MuiltipleKey()
    let g:which_key_map.g=GitKey()
    " let g:which_key_map.j=YCMKey()
    let g:which_key_map.j=CoCKey()
    let g:which_key_map.t=TabKey()
    let g:which_key_map['?']='search key'
    let g:which_key_map[';']='bottom command'
    let g:which_key_map['<CR>']='blank line to up'
    let g:which_key_map.S=WorkSpaceKey()
    let g:which_key_map.C=SpellCheck()
    call which_key#register('<Space>', "g:which_key_map")
endfunction

function! DebugMap()
    " mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

    " for normal mode - the word under the cursor
    nmap <Leader>di <Plug>VimspectorBalloonEval
    " for visual mode, the visually selected text
    xmap <Leader>di <Plug>VimspectorBalloonEval
    nmap <leader>dd :call vimspector#Launch()<CR>
    nmap <leader>do :VimspectorShowOutput<CR>
    nmap <leader>dw :VimspectorWatch<CR>
    nmap <leader>de :VimspectorEval<CR>
    return {
                \ 'name': '+DebugMap',
                \ 'i': 'VimspectorBalloonEval',
                \ 'o': 'VimspectorShowOutput',
                \ 'd': 'launch',
                \ 'w': 'watch',
                \ 'e': 'eval',
                \}
endfunction

function! g:TagKeyMap()
    nmap <leader>tt :Vista!!<CR>
    nmap <leader>tc :Vista coc<CR>
    return {
                \ 'name': '+Tag',
                \ 't': 'show tag',
                \ 'c' : 'lsp tag',
                \}
endfunction

function! CoCKey()
    nnoremap <leader>jR :CocRestart<CR>
    " nnoremap <silent><leader>jf :ALE<CR>
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

function! YCMKey()
    nnoremap <leader>jR :YcmRestartServer<CR>
    nnoremap <leader>jf :YcmCompleter FixIt<CR>
    nnoremap <leader>jjg :YcmCompleter Goto<CR>
    nnoremap <leader>jjd :YcmCompleter GotoDefinition<CR>
    nnoremap <leader>jjf :YcmCompleter GotoDeclaration<CR>
    nnoremap <leader>jjr :YcmCompleter GotoReferences<CR>
    nnoremap <leader>jgt :YcmCompleter GetType<CR>
    nnoremap <leader>jgd :YcmCompleter GetDoc<CR>
    nnoremap <leader>jo :YcmCompleter OrgnaizeImports<CR>
    nnoremap <leader>jc :YcmForceCompileAndDiagnostics<CR>
    nnoremap <leader>jr :RefactorRename<Space>
    return {
                \ 'name': '+YCM',
                \ 'R': 'YCM server restart',
                \ 'f': 'YCM fix it',
                \ 'j': {
                \ 'name': '+Goto',
                \ 'g': 'YCM Goto',
                \ 'd': 'YCM GotoDefinition',
                \ 'f': 'YCM GotoDeclaration',
                \ 'r': 'YCM GotoReferences'
                \ },
                \ 'g': {
                \ 'name': '+gets',
                \ 't': 'YCM GetType',
                \ 'd': 'YCM GetDoc'
                \ },
                \ 'o': 'YCM OrganizeImports',
                \ 'c': 'YCM Force Compile And Diagnostics',
                \ 'r': 'Refactor Rename'
                \ }
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
    nnoremap <leader>oc :tabnew $HOME/.vim/config/config_func.vim<CR>
    nnoremap <leader>ov :tabnew $HOME/.vim/vimrc<CR>
    nnoremap <leader>ot :call TermToggle(12)<CR>
    nnoremap <leader>of :<C-u>Findr<CR>
    return {
                \ 'name': '+open...',
                \ 'p': 'open plugin file',
                \ 'k': 'open key config file',
                \ 'c': 'open config plugin file',
                \ 'b': 'open basic config file',
                \ 'v': 'open vim init file',
                \ 'f': 'open files',
                \ 't': 'open terminal',
                \ }
endfunction

function! BetterKey()
    nnoremap <silent><leader>hr :set relativenumber!<CR>
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

function! FileKey()
    nnoremap <leader>fs  :w!<CR>
    nnoremap <leader>fr  :source $MYVIMRC<CR>
    nnoremap <leader>fS  :W<CR>
    nnoremap <leader>ft :CocCommand explorer<CR>
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

function! NERDTreeKey()
    nnoremap <leader>tt  :NERDTreeToggle<CR>
    nnoremap <leader>tf  :NERDTreeFind<CR>
    nnoremap <leader>ts  :NERDTree<CR>
    return {
                \ 'name': '+NERDTree',
                \ 't': 'NERDTree toggle',
                \ 'f': 'NERDTree find',
                \ 's': 'NERDTree'
                \ }
endfunction

function! BuffersKey()
    nnoremap <leader>bs  :Startify<CR>
    nnoremap <leader>bn  :bn<CR>
    nnoremap <leader>bp  :bp<CR>
    nnoremap <leader>bd  :bd<CR>
    nnoremap <leader>bb  :Clap buffers<CR>
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

function! AleKey()
    nnoremap <leader>la  :ALEToggle<CR>
    nnoremap <leader>ld  :ALEDetail<CR>
    nnoremap <leader>lp  :ALEPrevious<CR>
    nnoremap <leader>ln  :ALENext<CR>
    return {
                \ 'name': '+ale',
                \ 'a': 'ale off/on',
                \ 'd': 'ale warning/worried',
                \ 'p': 'ale previous',
                \ 'n': 'ale next'
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
    return {
                \ 'name': '+applications',
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
    nnoremap <leader>mf :<Plug>(easymotion-f)<CR>
    nnoremap <leader>mF :<Plug>(easymotion-F)<CR>
    nnoremap <leader>mt :<Plug>(easymotion-t)<CR>
    nnoremap <leader>mT :<Plug>(easymotion-T)<CR>
    nnoremap <leader>mw :<Plug>(easymotion-w)<CR>
    nnoremap <leader>mW :<Plug>(easymotion-W)<CR>
    nnoremap <leader>mb :<Plug>(easymotion-b)<CR>
    nnoremap <leader>mB :<Plug>(easymotion-B)<CR>
    nnoremap <leader>me :<Plug>(easymotion-e)<CR>
    nnoremap <leader>mE :<Plug>(easymotion-E)<CR>
    nnoremap <leader>mg :<Plug>(easymotion-ge)<CR>
    nnoremap <leader>mG :<Plug>(easymotion-gE)<CR>
    nnoremap <leader>mj :<Plug>(easymotion-j)<CR>
    nnoremap <leader>mJ :<Plug>(easymotion-J)<CR>
    nnoremap <leader>mk :<Plug>(easymotion-k)<CR>
    nnoremap <leader>mn :<Plug>(easymotion-n)<CR>
    nnoremap <leader>mN :<Plug>(easymotion-N)<CR>
    nnoremap <leader>ms :<Plug>(easymotion-s)<CR>
    nnoremap <leader>m. :<Plug>(easymotion-repeat)<CR>
    return {
                \ 'name':'+easymotion',
                \ "f":  [ "<Plug>(easymotion-f)", "easymotion-f"],
                \ "F":  [ "<Plug>(easymotion-F)", "easymotion-F"],
                \ "t":  [ "<Plug>(easymotion-t)", "easymotion-t"],
                \ "T":  [ "<Plug>(easymotion-T)", "easymotion-T"],
                \ "w":  [ "<Plug>(easymotion-w)","easymotion-w"],
                \ "W":  [ "<Plug>(easymotion-W)", "easymotion-W"],
                \ "b":  [ "<Plug>(easymotion-b)", "easymotion-b"],
                \ "B":  [ "<Plug>(easymotion-B)", "easymotion-B"],
                \ "e":  [ "<Plug>(easymotion-e)", "easymotion-e"],
                \ "E":  [ "<Plug>(easymotion-E)", "easymotion-E"],
                \ "g": ["<Plug>(easymotion-ge)" ,"easymotion-ge"],
                \ "G": ["<Plug>(easymotion-gE)" ,"easymotion-gE"],
                \ "j":  [ "<Plug>(easymotion-j)", "easymotion-j"],
                \ "k":  [ "<Plug>(easymotion-k)", "easymotion-k"],
                \ "n":  [ "<Plug>(easymotion-n)", "easymotion-n"],
                \ "N":  [ "<Plug>(easymotion-N)", "easymotion-N"],
                \ "s":  [ "<Plug>(easymotion-s)", "easymotion-s"],
                \ ".": ["<Plug>(easymotion-repeat)", "repeat motion"]
                \ }
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
    return {
                \ 'name': '+multiple cursors',
                \ 's': 'start word',
                \ 'e': 'start multiple',
                \ 'a': 'select all word',
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
  return {
        \ 'name': 'tab',
        \ 'n' : 'next tab',
        \ 'p' : 'prev tab',
        \ 'c' : 'close tab',
        \ 'w' : 'new tab',
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
    " au! BufNew,BufEnter *.org nnoremap <silent><buffer><localleader>m, /#+BEGIN_SRC .*\n\(.*\n\)*#+END_SRC\n<CR>gv:NN<CR>:nohlsearch<CR>
    nnoremap J gJ
    nnoremap gp `[v`]
    nnoremap <M-x> :Commands<CR>
    nnoremap < <<
    nnoremap > >>
    inoremap <C-e> <End>
    inoremap <C-a> <Esc>I
    nnoremap <silent><C-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
    nnoremap <silent><C-Down>  :<c-u>execute 'move +'. v:count1<cr>
    inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
    inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
    vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
    vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-l> <Right>
    inoremap <C-k> <Up>

    " Terminal Function
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
    " For Terminal For Basic {{
    nnoremap <A-t> :call TermToggle(12)<CR>
    inoremap <A-t> <Esc>:call TermToggle(12)<CR>
    tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap <ESC> <C-\><C-n>
    tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap :q! <C-\><C-n>:q!<CR>
    " }}
    nnoremap <leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
    nnoremap <CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent><leader><Up> :res -1<CR>
    nnoremap <silent><leader><Down> :res +1<CR>
    nnoremap <silent><leader><Left> :vertical res -1<CR>
    nnoremap <silent><leader><Right> :vertical res +1<CR>
    nnoremap wh <C-w><C-h>
    nnoremap wj <C-w><C-j>
    nnoremap wk <C-w><C-k>
    nnoremap wl <C-w><C-l>
    nnoremap <Up> gk
    nnoremap <Down> gj
    inoremap <Up> <C-o>gk
    inoremap <Down> <C-o>gj
    nnoremap <leader>; :
    nmap <leader>? <plug>(fzf-maps-n)
    xmap <leader>? <plug>(fzf-maps-x)
    omap <leader>? <plug>(fzf-maps-o)
    nmap <leader>q :q!<CR>
    nmap <leader>Q :qa!<CR>
    nnoremap <leader>y "+y
    xnoremap <leader>y "+y
    xnoremap <leader>p "+p
    nnoremap <leader>p "+p
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    inoremap <C-n> <Down>
    inoremap <C-p> <Up>
    inoremap <C-b> <Left>
    inoremap <C-f> <Right>
    " noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    " noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    " noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    " noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
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
    nmap as sa
    nmap ds sd
    nmap cs rs
    " For wildfire
    " This selects the next closest text object.
    map ; <Plug>(wildfire-fuel)
    " This selects the previous closest text object.
    vmap ; <Plug>(wildfire-water)
    imap jk <Esc>
endfunction

function BasicVimKeybinding()
    map <leader>ft :Vexplore<CR>
    map <leader>fs :w!<CR>
    nnoremap J gJ
    nnoremap <M-x> :Commands<CR>
    nnoremap < <<
    nnoremap > >>
    inoremap <C-e> <End>
    inoremap <C-a> <Esc>I
    nnoremap <silent><C-Up>  :<c-u>execute 'move -1-'. v:count1<cr>
    nnoremap <silent><C-Down>  :<c-u>execute 'move +'. v:count1<cr>
    inoremap <silent><C-Down> <Esc>:m .+1<CR>==gi
    inoremap <silent><C-Up> <Esc>:m .-2<CR>==gi
    vnoremap <silent><C-Down> :m '>+1<CR>gv=gv
    vnoremap <silent><C-Up> :m '<-2<CR>gv=gv
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-l> <Right>
    inoremap <C-s> <C-o>:wq!<CR>
    inoremap <C-k> <Up>
    " For Terminal For Basic {{
    nnoremap <A-t> :call TermToggle(12)<CR>
    inoremap <A-t> <Esc>:call TermToggle(12)<CR>
    tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap <ESC> <C-\><C-n>
    tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
    tnoremap :q! <C-\><C-n>:q!<CR>
    " }}
    nnoremap <leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
    nnoremap <CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent><leader><Up> :res -1<CR>
    nnoremap <silent><leader><Down> :res +1<CR>
    nnoremap <silent><leader><Left> :vertical res -1<CR>
    nnoremap <silent><leader><Right> :vertical res +1<CR>
    nnoremap wh <C-w><C-h>
    nnoremap wj <C-w><C-j>
    nnoremap wk <C-w><C-k>
    nnoremap wl <C-w><C-l>
    nnoremap <Up> gk
    nnoremap <Down> gj
    inoremap <Up> <C-o>gk
    inoremap <Down> <C-o>gj
    nnoremap <leader>; :
    nnoremap <leader>q :q!<CR>
    nnoremap <leader>Q :qa!<CR>
    nnoremap <leader>y "+y
    xnoremap <leader>y "+y
    xnoremap <leader>p "+p
    nnoremap <leader>p "+p
    inoremap <C-n> <Down>
    inoremap <C-p> <Up>
    inoremap <C-b> <Left>
    inoremap <C-f> <Right>
    nnoremap <leader>ea  ggVG
    nnoremap <leader>op :tabnew $HOME/.vim/config/plugin_config.vim<CR>
    nnoremap <leader>ok :tabnew $HOME/.vim/config/whichkey.vim<CR>
    nnoremap <leader>ob :tabnew $HOME/.vim/config/basic.vim<CR>
    nnoremap <leader>oc :tabnew $HOME/.vim/config/config_func.vim<CR>
    nnoremap <leader>ov :tabnew $HOME/.vim/vimrc<CR>
    noremap <leader>tn :tabn<CR>
    noremap <leader>tp :tabp<CR>
    noremap <leader>tc :tabclose<CR>
    noremap <leader>tw :tabnew<CR>
    nnoremap <leader>bn  :bn<CR>
    nnoremap <leader>bp  :bp<CR>
    nnoremap <leader>bd  :bd<CR>
endfunction

if g:vim_basic == 1
    call g:WhichKeyMap()
    call OtherKey()
else
    call BasicVimKeybinding()
endif

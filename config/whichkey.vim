function! g:WhichKeyMap()
    let g:which_key_map.f=FileKey()
    let g:which_key_map.s=SearchKey()
    let g:which_key_map.w=WindowsKey()
    let g:which_key_map.c=CommentKey()
    let g:which_key_map.b=BuffersKey()
    let g:which_key_map.t=NERDTreeKey()
    let g:which_key_map.P=PluginKey()
    let g:which_key_map.e=EditKey()
    let g:which_key_map.a=ApplicationKey()
    let g:which_key_map.u=UndoKey()
    let g:which_key_map.o=OpenKey()
    let g:which_key_map.h=BetterKey()
    let g:which_key_map.p={'name':'system paste'}
    let g:which_key_map.y={'name':'system copy'}
    let g:which_key_map.q={'name':'quit without save'}
    let g:which_key_map.Q={'name':'quit all'}
    let g:which_key_map.l=AleKey()
    let g:which_key_map.m=MovtionKey()
    let g:which_key_map.i=MuiltipleKey()
    let g:which_key_map['?']='search key'
    let g:which_key_map[';']='bottom command'
    call which_key#register('<Space>', "g:which_key_map")
endfunction

function! OpenKey()
    nnoremap <leader>op :tabnew $HOME/.vim/config/plugin_config.vim<CR>
    nnoremap <leader>ok :tabnew $HOME/.vim/config/whichkey.vim<CR>
    nnoremap <leader>ob :tabnew $HOME/.vim/config/basic.vim<CR>
    nnoremap <leader>oc :tabnew $HOME/.vim/config/config_func.vim<CR>
    return {
                \ 'name': '+open files',
                \ 'p': 'open plugin file',
                \ 'k': 'open key config file',
                \ 'c': 'open config plugin file',
                \ 'b': 'open basic config file'
                \ }
endfunction

function! BetterKey()
    nnoremap <silent><leader>hr :set relativenumber!<CR>
    nnoremap <silent><leader>hm :message<CR>
    nnoremap <silent><leader>hh :help
    xnoremap <silent><leader>hr :set relativenumber!<CR>
    nnoremap <silent><leader>hn :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
    return {
                \ 'name': 'better keybind',
                \ 'r': 'relative line number',
                \ 'n': 'no hightlight',
                \ 'm': 'show messages',
                \ 'h': 'help'
                \ }
endfunction

function! WindowsKey()
    nnoremap <leader>wc <Plug>(choosewin)
    nnoremap <leader>wd :only<CR>
    nnoremap <leader>wh <C-w><C-h>
    nnoremap <leader>wj <C-w><C-j>
    nnoremap <leader>wk <C-w><C-k>
    nnoremap <leader>wl <C-w><C-l>
    nnoremap <leader>ws :split<CR>
    nnoremap <leader>wv :vsplit<CR>
    return {
                \ 'name':'+windows',
                \ 'c': 'choose win',
                \ 'd': 'only win',
                \ 'h': 'move left',
                \ 'j': 'move down',
                \ 'k': 'move up',
                \ 'l': 'move right',
                \ 's': 'split window',
                \ 'v': 'vertical split'
                \ }
endfunction

function! FileKey()
    nnoremap <leader>fs  :w!<CR>
    nnoremap <leader>fr  :source %<CR>
    nnoremap <leader>fS  :w! sudo tee %<CR>
    nnoremap <leader>ft :NERDTreeToggle<CR>
    return {
                \ 'name': '+files',
                \ 's': 'save file',
                \ 'r': 'reload vim file',
                \ 'S': 'sudo save',
                \ 't': 'NERDTree Toggle'
                \ }
endfunction

function! PluginKey()
    nnoremap <leader>Pi  :PluginInstall<CR>
    nnoremap <leader>Pc  :PluginClean<CR>
    nnoremap <leader>Pp  :PluginUpdate<CR>
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
    return {
                \ 'name': '+Buffers',
                \ 's': 'start buffer',
                \ 'n': 'next buffer',
                \ 'p': 'pervious buffer'
                \ }
endfunction

function! CommentKey()
    return {
                \ 'name':'+comment',
                \ }
endfunction

function! EditKey()
    "UltiSnips config
    let g:UltiSnipsExpandTrigger="<Space>eue"
    let g:UltiSnipsJumpForwardTrigger="<Space>euf"
    let g:UltiSnipsJumpBackwardTrgger="<Space>eub"
    let g:UltiSnipsListSnippets="<Space>eul"
    nnoremap <leader>ef  :Autoformat<CR>
    nnoremap <leader>ea  ggVG
    nnoremap <leader>eja  :JCimportAddSmart<CR>
    nnoremap <leader>ejr  :JCimportsRemovedUnused<CR>
    return {
                \ 'name': '+edit',
                \ 'f': 'format code',
                \ 'a': 'select all',
                \ 'j': {
                \ 'name': '+javacomplete2',
                \ 'a': 'add import',
                \ 'r': 'remove unused import'
                \ },
                \ 'u': {
                \ 'name': '+ultisnips',
                \ 'e': 'expend snips',
                \ 'f': 'jump forward',
                \ 'b': 'jump backward',
                \ 'l': 'list snippets',
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
    nnoremap <leader>aii  :InterestingWords('n')"<CR>
    nnoremap <leader>aiu :UncolorAllWords()<CR>
    nnoremap <leader>aip :WordNavigation('forward')<CR>
    nnoremap <leader>ain :WordNavigation('backword')<CR>
    nnoremap <leader>aqr :QuickRun<CR>
    nnoremap <leader>atb :Tagbar<CR>
    nnoremap <leader>az :Goyo<CR>
    nnoremap <leader>ad :IciFrom<CR>
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
                \ 'name': '+tagbar',
                \ 'b': 'tagbar',
                \ },
                \ 'z': 'vim zenroom2',
                \ 'd': 'word means',
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
    nnoremap <leader>sf :FZF<CR>
    nnoremap <leader>ss :Blines<CR>
    nnoremap <leader>sb :Buffers<CR>
    nnoremap <leader>sc :Colors<CR>
    return {
                \ 'name': '+search',
                \ 'f': 'find files',
                \ 's': 'search lines',
                \ 'b': 'search buffers',
                \ 'c': 'search color theme'
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
    let g:multi_cursor_start_word_key      = '<leader>is'
    let g:multi_cursor_select_all_word_key = '<leader>ia'
    let g:multi_cursor_start_key           = '<leader>ie'
    let g:multi_cursor_select_all_key      = '<leader>iA'
    let g:multi_cursor_next_key            = '<leader>in'
    let g:multi_cursor_prev_key            = '<leader>ip'
    let g:multi_cursor_skip_key            = '<leader>ic'
    let g:multi_cursor_quit_key            = '<Esc>'
    return {
                \ 'name': '+multiple cursors',
                \ 's': 'start word',
                \ 'e': 'start multiple',
                \ 'a': 'select all word',
                \ 'A': 'select all key',
                \ 'n': 'next word',
                \ 'p': 'prev word',
                \ 'c': 'skip word',
                \ }
endfunction

function! OtherKey()
    for s:i in range(1, 9)
      " <Leader>[1-9] move to window [1-9]
        execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
    endfor
    nnoremap < <<
    nnoremap > >>
    inoremap <C-e> <End>
    inoremap <C-a> <Home>
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
    tnoremap <ESC> <C-\><C-n>
    nnoremap <leader><CR>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
    nnoremap <CR>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
    nnoremap <silent><leader><Up> :res -1<CR>
    nnoremap <silent><leader><Down> :res +1<CR>
    nnoremap <silent><leader><Left> :vertical res -1<CR>
    nnoremap <silent><leader><Right> :vertical res +1<CR>
    nnoremap <leader>; :
    nmap <leader>? <plug>(fzf-maps-n)
    xmap <leader>? <plug>(fzf-maps-x)
    omap <leader>? <plug>(fzf-maps-o)
    nnoremap <leader>q :q!<CR>
    nnoremap <leader>Q :qa!<CR>
    nnoremap <leader>y "+y
    nnoremap <leader>p "+p
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
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
endfunction

call g:WhichKeyMap()
call OtherKey()
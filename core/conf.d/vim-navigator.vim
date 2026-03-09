let g:navigator = {
            \ "f": { "name": "files..." },
            \ "j": { "name": "coc..." },
            \ "b": { "name": "buffers..." },
            \ "o": { "name": "opne..." },
            \ "P": { "name": "plugn..." },
            \ "p": { "name": "project and session..." },
            \ "w": { "name": "window..." },
            \ "s": { "name": "search..." },
            \ "g": { "name": "git..."},
            \ "e": { "name": "easymotion..." },
            \ "c": { "name": "comment..." },
            \ "a": { "name": "async run..." },
            \ "t": { "name": "terminal..." }
            \ }

let g:navigator.prefix = "<tab><tab>"

function! DeepMerge(dest, src) abort
    for [key, val] in items(a:src)
        " 如果键在两个字典中都存在，且都是字典，则递归合并
        if has_key(a:dest, key) 
                    \  && type(a:dest[key]) == v:t_dict 
                    \  && type(val) == v:t_dict
            call DeepMerge(a:dest[key], val)
        else
            " 否则直接赋值（覆盖或新增）
            let a:dest[key] = val
        endif
    endfor
    return a:dest
endfunction

nmap <tab><tab> :Navigator g:navigator<CR>

function! ExtendNavigator(tag, src)
    if a:tag == 'builtin' || index(g:packs_config_list, a:tag) >= 0
        call DeepMerge(g:navigator, a:src)
    endif
endfunction

" =============
" ../builtin.vim 
" =============

call ExtendNavigator('builtin', {
            \ "q": ["utils#quit()", "quit"],
            \ "f": {
                \ "s": [":w", "save file"],
                \ "S": ["utils#sudo_save()", "save file with root"],
            \ },
            \ "Q": [":qa!", "quit vim"],
            \ "w": {
                \ "1": [":1wincmd w", "jump to window 1"],
                \ "2": [":2wincmd w", "jump to window 2"],
                \ "3": [":3wincmd w", "jump to window 3"],
                \ "4": [":4wincmd w", "jump to window 4"],
                \ "5": [":5wincmd w", "jump to window 5"],
                \ "6": [":6wincmd w", "jump to window 6"],
                \ "7": [":7wincmd w", "jump to window 7"],
                \ "8": [":8wincmd w", "jump to window 8"],
                \ "9": [":9wincmd w", "jump to window 9"],
                \ "c": [":close", "close current win"],
                \ "s": [":split", "split window"],
                \ "v": [":vsplit", "vsplit window"],
            \ },
            \ "o": {
                \ "p": [printf(":e %s", utils#stdpath(fnameescape($CORE_CONFIG.'/plugins.vim'))), "open plugin config"]
              \ },
            \ })

" =============
" ./coc.vim
" =============

call ExtendNavigator('coc', {
            \ "f" : {
                \ "t": [":CocCommand explorer --toggle --sources=buffer-,file+ --preset", "open ", "open file tree"]
            \ },
            \ "y": [":CocList -A --normal yank", "coc yank"],
            \ "j": {
                \ 'a': ['<plug>(coc-codeaction)', 'code action'],
                \ 'c': ['<plug>(coc-diagnostic-info)', 'show diagnostics for current line'],
                \ 'd': [':CocList diagnostics', 'show diagnostics'],
                \ 'e': ['<plug>(coc-codeaction-refactor)', 'refactor'],
                \ 'f': ['<plug>(coc-fix-current)', 'auto fix current'],
                \ 'F': ["call CocActionAsync('fixAll')", 'auto fix all'],
                \ 'l': ['<plug>(coc-codelens-action)', 'codelens-action'],
                \ 'r':  ['<plug>(coc-rename)', 'rename'],
                \ 'o': [':call ToggleOutline()', 'toggle outline'],
                \ 'k': [':call ShowDocumentation()', 'show hover'],
                \ 'D': ["<KEY>:let b:coc_suggest_disable = !get(b:, 'coc_suggest_disable', 0)<CR>", "toggle suggest in current buffer"],
                \ '=': [':Format', 'format code'],
            \ },
            \ "o": {
                \ "C": [":CocConfig", "open coc-settings.json"]
              \ }
            \ })

" =============
" ./airline.vim
" =============

call ExtendNavigator('airline', {
            \ "b": {
                \ "1": ["<plug>AirlineSelectTab1", "jump to tab 1"],
                \ "2": ["<plug>AirlineSelectTab2", "jump to tab 2"],
                \ "3": ["<plug>AirlineSelectTab3", "jump to tab 3"],
                \ "4": ["<plug>AirlineSelectTab4", "jump to tab 4"],
                \ "5": ["<plug>AirlineSelectTab5", "jump to tab 5"],
                \ "6": ["<plug>AirlineSelectTab6", "jump to tab 6"],
                \ "7": ["<plug>AirlineSelectTab7", "jump to tab 7"],
                \ "8": ["<plug>AirlineSelectTab8", "jump to tab 8"],
                \ "9": ["<plug>AirlineSelectTab9", "jump to tab 9"],
                \ "p": ["<plug>AirlineSelectPrevTab", "prev tab"],
                \ "n": ["<plug>AirlineSelectPrevTab", "next tab"],
            \ }
  \ })

" =============
" ./vim-plug.vim
" =============

call ExtendNavigator('vim-plug', {
            \ "P": {
                \ "i": [":PlugInstall", "install plugins"],
                \ "u": [":PlugUpdate", "update plugins"],
                \ "g": [":PlugUpgrade", "upgrade vim-plug"],
              \ }
  \ })

" =============
" ./leaderf.vim
" =============

cal ExtendNavigator('leaderf', {
            \ "s": {
                \ 'l': [':Leaderf line', '[S]earch [L]ines'],
                \ 'b': [':Leaderf buffer', '[S]earch [B]uffers'],
                \ 'h': ['Leaderf help', '[S]earch [H]elptags'],
                \ 'r': ['Leaderf rg', '[S]earch by [R]g'],
                \ 'd': [':LeaderfFile', '[S]earch [D]ir file'],
            \ },
            \ "o": {
                \"c": [printf(":Leaderf file %s<CR>", $CORE_CONFIG), "open core config dir"]
              \ }
            \ })

" =============
" ./git.vim
" =============

call ExtendNavigator("git", {
            \ "g": {
                \ "a": [":Git add .", "[G]it [a]dd all"],
                \ "b": [":Git blame", "[G]it [B]lame"],
                \ "c": [":Git commit", "[G]it [C]ommit"],
                \ "d": [":Gdiff", "diff current file"],
                \ "r": [":Gread", "[G]it [R]estore file"],
                \ "g": [":Git", "[G]it"],
                \ "p": {
                    \ "name": "push or pull..",
                    \ "s": [":Git! push", "push"],
                    \ "l": [":Git! pull", "pull"],
                \ },
                \ "x": [":GitGutterToggle", "highlight diff"],
                \ "w": [":Gwrite", "store file"],
            \ }
            \ })


" =================
" ./easymotion.vim
" =================

call ExtendNavigator("easymotion", {
            \ "e": {
                \ "f": ["<Plug>(easymotion-overwin-f)", "search 1 char"],
                \ "F": ["<Plug>(easymotion-overwin-f2)", "search 2 char"]
              \ }
  \ })

" ================
" ./comment.vim
" ================

call ExtendNavigator("comment", {
            \ "c": {
                \ "i": ["<plug>(comment-toggle-line)", "comment current"]
              \ }
  \ })

" ================
" ./nerdcommenter.vim
" ================

call ExtendNavigator("nerdcommenter", {
            \ "c": {
                \ "c": ["<plug>(NERDCommenterComment)", "comment current"],
                \ "i": ["<plug>(NERDCommenterInvert)", "toggles the comment state"],
                \ "s": ["<plug>(NERDCommenterSexy)", "Comments with a pretty layout."]
              \ }
  \ })
" ===================
" ./vim-project.vim
" ===================

" call ExtendNavigator("vim-project", {
"             \ "s": {
"                 \ 'p': [':ProjectList', '[S]earch [P]rojects'],
"               \ }
"   \ })

" ==================
" ./vim-session.vim
" ==================

call ExtendNavigator("vim-session", {
            \ "p": {
                \ "a": [":AddCurrentProject", "add current project"],
                \ "s": ["<KEY>:SaveSession", "save session"],
                \ "o": [":OpenSession", "open session"],
                \ "d": [":DeleteSession", "delete session"],
                \ "c": [":CloseSession", "close session"],
              \ },
             \ "s": {
                 \ 'p': [':OpenSession', '[S]earch [P]rojects'],
               \ }
  \ })

" ==================
" ./asyncrun.vim
" ==================

call ExtendNavigator("asyncrun", {
            \ "a" : {
                \ "r": ["<KEY>:AsyncRun<Space>", "run cmd async"]
              \ }
  \ })

" ==================
" ./vim-winlayout.vim
" ==================

call ExtendNavigator("vim-winlayout", {
            \ "w": {
                \ "b": ["<Plug>(WinlayoutBackward)", "backward win layout"],
                \ "p": ["<Plug>(WinlayoutForward)", "forward win layout"],
              \ }
  \ })

" ==========================
" ./vim-floaterm.vim
" ==========================

call ExtendNavigator("vim-floaterm", {
            \ "t": {
                \ "f": [":LeaderF floaterm", "search floaterm"],
              \ }
  \ })

" ==========================
" ./vim-floaterm.vim
" ==========================

call ExtendNavigator("vim-floaterm", {
            \ "a": {
                \ "f": ["<KEY>:FloatermNew --name=make<Space>", "run make in floaterm"],
                \ "m": [":FloatermShow make", "show make floaterm"],
              \ },
              \ "t": {
                  \ "t": [":FloatermToggle", "toggle floaterm"],
                  \ "n": [":FloatermNew", "new floaterm"],
                  \ "k": ["<KEY>:FloatermKill", "kill floaterm"],
                \ }
      \ })

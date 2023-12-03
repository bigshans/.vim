call DetectKeyMapRegister(g:navigator, ";")
call DetectKeyMapRegister(g:navigator_visual, ";")

function! FormatKey()
    try
        call CocAction('format')
    catch
        try
            exec 'Autoformat'
        catch
            call feedkeys('=', 'n')
        endtry
    endtry
endfunction

let g:navigator[";"] = {
            \ "=": ["FormatKey()", "format code"],
            \ "<Up>": [":res -1", "desc height"],
            \ "<Down>": [":res +1", "asc height"],
            \ "<Left>": [":vertical res -1", "desc width"],
            \ "<Right>": [":vertical res -1", "asc width"],
            \ "m": {
            \   "m": [ "<KEY>:<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>", "macro"]
            \ },
            \ "v": [":vsplit", "vsplit"],
            \ "s": [":split", "split"],
            \ "f": ["<plug>(easymotion-overwin-f)", "easymotion one char"],
            \ "F": ["<plug>(easymotion-overwin-f2)", "easymotion two char"],
            \ "c": {
            \ "i": ["<KEY>*Ncgn", "change word"],
            \ }
            \ }

let g:navigator_visual[";"] = {
            \ "=": ["FormatKey()", "format code"],
            \ "c": {
            \ "i": ["<KEY>y/<C-r>0<CR>Ncgn", "change word"],
            \ }
            \ }

" easymotion {{
nmap ,F <Plug>(easymotion-overwin-f2)
nmap ;f <Plug>(easymotion-overwin-f)
" }}
nmap ;ci *Ncgn
vmap ;ci y/<C-r>0<CR>Ncgn
vmap ;= :call FormatKey<CR>
nmap ;= :call FormatKey()<CR>
nmap ;<Up> :res -1<CR>
nmap ;<Down> :res +1<CR>
nmap ;<Left> :vertical res -1<CR>
nmap ;<Right> :vertical res +1<CR>

nmap ;v :vsplit<CR>
nmap ;s :split<CR>
nnoremap ;mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

let @t="@q@t"

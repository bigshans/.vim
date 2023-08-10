call DetectKeyMapRegister(g:navigator, ",")
call DetectKeyMapRegister(g:navigator_visual, ",")

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

let g:navigator[","] = {
            \ "=": ["FormatKey()", "format code"],
            \ "<Up>": [":res -1", "desc height"],
            \ "<Down>": [":res +1", "asc height"],
            \ "<Left>": [":vertical res -1", "desc width"],
            \ "<Right>": [":vertical res -1", "asc width"],
            \ "v": [":vsplit", "vsplit"],
            \ "s": [":split", "split"],
            \ "c": {
            \ "i": ["<KEY>*Ncgn", "change word"],
            \ }
            \ }

let g:navigator_visual[","] = {
            \ "=": ["FormatKey()", "format code"],
            \ "c": {
            \ "i": ["<KEY>y/<C-r>0<CR>Ncgn", "change word"],
            \ }
            \ }

nmap ,ci *Ncgn
vmap ,ci y/<C-r>0<CR>Ncgn
vmap ,= :call FormatKey<CR>
nmap ,= :call FormatKey()<CR>
nmap ,<Up> :res -1<CR>
nmap ,<Down> :res +1<CR>
nmap ,<Left> :vertical res -1<CR>
nmap ,<Right> :vertical res +1<CR>

nmap ,v :vsplit<CR>
nmap ,s :split<CR>

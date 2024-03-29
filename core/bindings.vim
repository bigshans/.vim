command! -nargs=1 InitKey exec 'IncScript core/bindings/'.fnameescape("<args>.vim")

let g:navigator = {}
let g:navigator_visual = {}
let g:navigator_insert = {}
let g:navigator_x = {}
let g:navigator_t = {}

function! DetectKeyMapRegister(obj, key)
    if !has_key(a:obj, a:key)
        let a:obj[a:key] = { 'prefix': a:key }
    endif
endfunction

function! s:ParserKey(key)
    let parser_key = substitute(a:key, "<", ";lt", 'g')
    let parser_key = substitute(parser_key, ">", ";gt", 'g')
    return parser_key
endfunction

function! MakeLocal(da, db) abort
    let l:dc = {}
    for key in keys(a:da)
        let l:dc[key] = a:da[key]
    endfor
    for key in keys(a:db)
        let l:dc[key] = a:db[key]
    endfor
    return l:dc
endfunction

function s:MapNavigator(list, list_name, status)
    let l:old = deepcopy(a:list)
    for key in keys(l:old)
        let parser_key = s:ParserKey(key)
        let a:list[parser_key] = a:list[key]
        if a:status == 'normal'
            exec 'nmap ' . key . " :Navigator " . a:list_name . "['" . parser_key . "']<CR>"
        else
            exec 'vmap ' . key . " :NavigatorVisual " . a:list_name . "['" . parser_key . "']<CR>"
        endif
    endfor
endfunction

InitKey search
InitKey open
InitKey file
InitKey coc
InitKey git
InitKey plugin
InitKey comment
InitKey tag
InitKey win
InitKey comma
InitKey others
InitKey buffer
InitKey fold

call s:MapNavigator(g:navigator, 'g:navigator', "normal")
call s:MapNavigator(g:navigator_visual, 'g:navigator_visual', "visual")

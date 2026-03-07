" 全局导航映射字典
let g:navigator = {}
let g:navigator_visual = {}
let g:navigator_insert = {}
let g:navigator_x = {}
let g:navigator_t = {}

" 键映射注册函数
function! DetectKeyMapRegister(obj, key)
    if !has_key(a:obj, a:key)
        let a:obj[a:key] = { 'prefix': a:key }
    endif
endfunction

" 键名解析函数
function! s:ParserKey(key)
    let parser_key = substitute(a:key, "<", ";lt", 'g')
    let parser_key = substitute(parser_key, ">", ";gt", 'g')
    return parser_key
endfunction

" 字典合并函数
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

" 导航映射函数
function s:MapNavigator(list, list_name, status)
    let l:old = deepcopy(a:list)
    for key in keys(l:old)
        let parser_key = s:ParserKey(key)
        let a:list[parser_key] = a:list[key]
        if a:status is# 'normal'
            exec 'nmap ,' . key . " :Navigator " . a:list_name . "['" . parser_key . "']<CR>"
        else
            exec 'vmap ,' . key . " :NavigatorVisual " . a:list_name . "['" . parser_key . "']<CR>"
        endif
    endfor
endfunction

" 初始化键映射注册
call DetectKeyMapRegister(g:navigator, "<leader>")
call DetectKeyMapRegister(g:navigator_x, "<leader>")
call DetectKeyMapRegister(g:navigator, ";")
call DetectKeyMapRegister(g:navigator_visual, ";")

" 加载配置模块命令
command! -nargs=1 InitKey exec 'IncScript core/bindings/'.fnameescape("<args>.vim")

" 加载各个功能模块
InitKey search
InitKey open
InitKey file
InitKey coc
InitKey git
InitKey plugin
InitKey comment
InitKey terminal
InitKey win
InitKey localleader
InitKey others
InitKey buffer
InitKey fold
InitKey project
" InitKey gscope

" 应用导航映射
call s:MapNavigator(g:navigator, 'g:navigator', "normal")
call s:MapNavigator(g:navigator_visual, 'g:navigator_visual', "visual")

" =============================================================================
" 插件管理模块
" =============================================================================

" 存储配置列表
let s:config_list = []

" 添加插件配置（兼容原有参数）
function plugin#append(...) abort
    if a:0 == 1
        Plug a:1
    elseif a:0 == 2
        if type(a:1) == type(a:2)
            call add(s:config_list, a:1)
            Plug a:2
        else
            Plug a:1, a:2
        endif
    elseif a:0 == 3
        call add(s:config_list, a:1)
        Plug a:2, a:3
    endif
endfunction

" 结束插件配置并加载
function plugin#end() abort
    call plug#end()
    call plugin#load_config()
endfunction

" 加载所有插件配置
function plugin#load_config() abort
    for config_name in s:config_list
        let config_file = $HOME_VIM . "/core/config/" . config_name . ".vim"
        if filereadable(expand(config_file)) == 1
            exec "source " . config_file
        endif
    endfor
endfunction
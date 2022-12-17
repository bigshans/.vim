let s:config_list = []
let s:lua_config = []
function p#append(...)
    if a:0 > 1
        call add(s:config_list, a:1)
    endif
    if a:0 == 1
        Plug a:1
    elseif a:0 == 2
        Plug a:2
    elseif a:0 == 3
        Plug a:2,a:3
    endif
endfunction

function p#append_lua(...)
    if a:0 > 1
        call add(s:lua_config, a:1)
    endif
    if a:0 == 1
        Plug a:1
    elseif a:0 == 2
        Plug a:2
    elseif a:0 == 3
        Plug a:2,a:3
    endif
endfunction

function p#end()
    call plug#end()
    call p#load_config()
endfunction

function p#load_config() abort
    for config_name in s:config_list
        let config_file = expand("~/.vim/core/config/" . config_name . ".vim")
        if filereadable(config_file) == 1
            exec "source " . config_file
        endif
    endfor
    for config_name in s:lua_config
        exec "lua require('lua_plugin')['" . config_name . "']()"
    endfor
endfunction

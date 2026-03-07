let g:packs_config_list = []

function! packs#begin(bundle)
    let g:packs_config_list = ['vim-plug']
    call plug#begin(a:bundle)
endfunction

function! packs#add(plugin, ...)
    exec 'packadd ' . a:plugin
    if a:0 > 0
        call add(g:packs_config_list, a:1)
    endif
endfunction

function! packs#def(repo, ...)
    " a:0 表示额外参数的数量
    " a:1 第一个可选参数，a:2 第二个可选参数

    if a:0 == 0
        " 场景: packs#def('tpope/vim-surround')
        Plug a:repo
    
    elseif a:0 == 1
        if type(a:1) == v:t_dict
            " 场景: packs#def('repo', {'on': '...'})
            Plug a:repo, a:1
        else
            " 场景: packs#def('repo', 'config_name')
            Plug a:repo
            call add(g:packs_config_list, a:1)
        endif

    elseif a:0 == 2
        " 场景: 混合了配置名和插件选项
        if type(a:1) == v:t_string
            call add(g:packs_config_list, a:1)
            Plug a:repo, a:2
        else
            call add(g:packs_config_list, a:2)
            Plug a:repo, a:1
        endif
    endif
endfunction

function! packs#end()
    call plug#end()
    for l:config_name in g:packs_config_list
        " 确保 $HOME_VIM 已经定义，或者使用 expand('~/.vim')
        let l:config_file = expand($HOME_VIM . "/core/conf.d/" . l:config_name . ".vim")
        if filereadable(l:config_file)
            execute "source " . fnameescape(l:config_file)
        endif
    endfor
endfunction

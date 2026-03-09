nmap <leader>af :call FloatermCmd()<CR>
nmap <leader>am :FloatermShow make<CR>
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tn :FloatermNew<CR>
nmap <leader>tk :call FloatermKillCmd()<CR>

function! FloatermCmd() abort
    let l:cmd = input('Floaterm Shell: ')

    " 如果输入为空，直接跳过不执行
    if empty(l:cmd)
        return
    endif

    execute 'FloatermNew --name=make --autoclose=0 ' . l:cmd
endfunction

function! FloatermKillCmd() abort
    " 提示输入要关闭的窗口名称 (--name)
    let l:name = input('Kill Floaterm (name): ')

    " 如果输入为空，直接执行 FloatermKill（通常关闭当前活动浮窗）
    if empty(l:name)
        FloatermKill
    else
        " 如果指定了名字，拼接执行
        execute 'FloatermKill ' . l:name
    endif
endfunction

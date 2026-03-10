nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tn :FloatermNew<CR>
nmap <leader>tk :call FloatermKillCmd()<CR>

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

let g:asyncrun_open = 8
nn <leader>ar :call RunCmdAsync()<CR>
nn <leader>ad :AsyncStop<CR>
" 每隔 100 毫秒刷新一次 Quickfix 窗口（默认是 200ms）
let g:asyncrun_timer = 100

" 当 AsyncRun 任务停止（结束）时触发
augroup MyAsyncRun
    autocmd!
    " 任务结束后自动跳转到 Quickfix 窗口
    autocmd User AsyncRunStop copen | wincmd p | cwindow | wincmd j
augroup END

function! RunCmdAsync() abort
    " 获取用户输入，并设置默认前缀（可选）
    let l:cmd = input('AsyncRun Shell: ')
    
    " 如果输入为空则取消执行
    if empty(l:cmd)
        return
    endif

    " 执行 AsyncRun，注意这里使用 execute 来拼接变量
    " 使用 ! 确保命令在系统 shell 中运行
    execute 'AsyncRun! ' . l:cmd
endfunction

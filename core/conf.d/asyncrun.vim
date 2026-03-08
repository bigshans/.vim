let g:asyncrun_open = 8
nn <leader>ar :AsyncRun<Space>
" 每隔 100 毫秒刷新一次 Quickfix 窗口（默认是 200ms）
let g:asyncrun_timer = 100

" 当 AsyncRun 任务停止（结束）时触发
augroup MyAsyncRun
    autocmd!
    " 任务结束后自动跳转到 Quickfix 窗口
    autocmd User AsyncRunStop copen | wincmd p | cwindow | wincmd j
augroup END

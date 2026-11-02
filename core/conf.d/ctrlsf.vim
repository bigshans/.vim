nmap <C-S-f> :CtrlSF<Space>
" 控制台对字母键不区分 Ctrl+Shift（<C-S-f> 实际等于 <C-F>，会抢翻页），
" Windows 下额外给一个可达的键位
if has('win32') || has('win64')
    nmap <leader>sg :CtrlSF<Space>
endif

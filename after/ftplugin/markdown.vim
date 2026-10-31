scriptencoding utf-8
" 在运行时 ftplugin 之后注册 undo，避免 b:undo_ftplugin 被覆盖
call utils#undo_append('call utils#unmap_buffer(["<C-b>", "<C-i>", "<C-d>", "<C-u>", "<C-`>", "<C-l>", "<M-l>", "<Tab>", "<leader>mt="]) | setlocal colorcolumn< conceallevel< | unlet! b:coc_suggest_disable')

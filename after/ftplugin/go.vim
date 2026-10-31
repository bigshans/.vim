" 在运行时 ftplugin 之后注册 undo，避免 b:undo_ftplugin 被覆盖
call utils#undo_append('setlocal expandtab<')

scriptencoding utf-8
" 优先用 fcitx5-remote 外部命令切换输入法状态。
" 否则插件会走 python3 + dbus 分支，导入模块约 45ms。
if executable('fcitx5-remote')
    let g:fcitx5_remote = 'fcitx5-remote'
endif

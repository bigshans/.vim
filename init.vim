let g:nvim_config_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" 墨观 Inkstone 主题插件 (本地开发，不在 vim-plug 管理范围内)
exec 'set rtp+=' . fnameescape(g:nvim_config_home . '/bundle/vim-inkstone')
if exists('g:vscode')
    exec 'so ' . fnameescape(g:nvim_config_home."/vscode/init.vim")
else
    exec 'so ' . fnameescape(g:nvim_config_home."/_vimrc")
endif

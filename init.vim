let g:nvim_config_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
if exists('g:vscode')
    exec 'so ' . fnameescape(g:nvim_config_home."/vscode/init.vim")
else
    exec 'so ' . fnameescape(g:nvim_config_home."/_vimrc")
endif

let g:nvim_config_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'so ' . fnameescape(g:nvim_config_home."/_vimrc")

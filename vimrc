let g:vim_config_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(g:vim_config_home."/<args>")
exec 'set rtp+='. fnameescape(g:vim_config_home)
exec 'set rtp+=~/.vim'

if has("win32") || has("win64")
    set pythondll=~/AppData/Local/Programs/Python/Python311/python311.dll
endif

IncScript core/mini.vim
IncScript core/preload.vim
IncScript core/plugin.vim
IncScript core/bindings.vim

call config#hugefile()

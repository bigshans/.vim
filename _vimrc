let g:vim_config_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
if has("win32") || has("win64")
    let g:vim_config_home = "~/vimfiles"
endif
command! -nargs=1 IncScript exec 'so '. fnameescape(g:vim_config_home."/<args>")
exec 'set rtp+='. fnameescape(g:vim_config_home)
if has('vim') || has('win32') || has('win64')
    exec 'set rtp+=~/.vim'
endif

IncScript core/preload.vim
IncScript core/plugin.vim
IncScript core/bindings.vim
IncScript core/theme.vim

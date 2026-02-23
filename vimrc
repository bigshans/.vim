" 使用环境变量 HOME_VIM 作为配置主目录
let $HOME_VIM = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'source '.fnameescape($HOME_VIM."/".<q-args>)

exec 'set rtp+='. fnameescape($HOME_VIM)
if has("win32") || has("win64")
    exec 'set rtp+=~/vimfiles'
else
    exec 'set rtp+=~/.vim'
endif

if has("win32") || has("win64")
    set pythondll=~/AppData/Local/Programs/Python/Python311/python311.dll
endif

IncScript core/preload.vim
IncScript core/plugin.vim
IncScript core/bindings.vim
IncScript core/theme.vim

" call config#hugefile()

let g:new_vim = 1

let s:curfile = expand("<sfile>")
let s:curfiledir = fnamemodify(s:curfile, ":h")
let g:user_vim_config = s:curfiledir

if has("win32") || has("win64")
    set pythondll=~/AppData/Local/Programs/Python/Python311/python311.dll
    set runtimepath+=$HOME/.vim
    let g:user_core = g:user_vim_config . '\.vim\core\'
else
    let g:user_core = g:user_vim_config . '/.vim/core/'
endif

if g:new_vim == 1
    let s:start_scripts = ['mini.vim', 'preload.vim', 'plugin.vim', 'bindings.vim']
    for script_path in s:start_scripts
        execute 'source ' g:user_core.script_path
    endfor
    " call whichkey#end()
    call config#hugefile()
endif

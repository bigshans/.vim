let g:new_vim = 1

let g:user_vim_config = fnamemodify(expand('<sfile>'), ':h')
let g:user_core = g:user_vim_config . '/core/'

if g:new_vim == 1
    let s:start_scripts = ['mini.vim', 'preload.vim', 'plugin.vim', 'basickey.vim', 'extends/keybindings.vim']
    for script_path in s:start_scripts
        execute 'source' g:user_core.script_path
    endfor
    call whichkey#end()
	call config#hugefile()
endif

let g:new_vim = 1

if g:new_vim == 1
    source $HOME/.vim/core/mini.vim
    source $HOME/.vim/core/preload.vim
    source $HOME/.vim/core/plugin.vim
    source $HOME/.vim/core/basickey.vim
	source $HOME/.vim/core/extends/keybindings.vim
    call whichkey#end()
	call config#hugefile()
endif

if !exists('g:vim_basic')
    let g:vim_basic = 0
endif

augroup config
    au!
    source $HOME/.vim/config/basic.vim
    if g:vim_basic == 1
        source $HOME/.vim/config/plugin_config.vim
    else
        source $HOME/.vim/config/vim_plugin.vim
    endif
    source $HOME/.vim/config/whichkey.vim
augroup END

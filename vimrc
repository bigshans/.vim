let g:vim_basic = 1

augroup config
    au!
    source $HOME/.vim/config/basic.vim
    if g:vim_basic == 1
        source $HOME/.vim/config/config_func.vim
        source $HOME/.vim/config/plugin_config.vim
    endif
    source $HOME/.vim/config/whichkey.vim
augroup END

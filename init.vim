if exists('g:vscode')
    source $HOME/.vim/vscode/init.vim
elseif has('nvim')
else
    let g:vim_basic = 1
    source $HOME/.vim/vimrc
endif

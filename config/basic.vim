let mapleader="\<Space>"
set nocompatible
set hidden
set mouse=a
set lazyredraw
set synmaxcol=200
set timeout
set noshowmode
set cursorline "当前行高亮
set t_Co=256
set background=dark
set number " relativenumber
set hlsearch
set title
set backspace=indent,eol,start
syntax enable
syntax on
set whichwrap+=<,>,h,l
set magic
set encoding=utf-8
set laststatus=2
set complete-=k complete+=k
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set formatoptions+=mM
set smartindent
set autoindent
set list
if !has('nvim')
    set listchars=eol:↩︎
endif
set laststatus=2
set writebackup
set nobackup
if has('gui_running') || exists('g:nyaovim_version')
    set guioptions-=T
    " set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=NotoMonoforPowerline\ 09
endif
augroup Web
    autocmd!
    autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set tabstop=2 shiftwidth=2 shiftwidth=2
augroup END
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
command! Hex :%!xxd
command! HexExit :%!xxd -r
" my personal script for my keybind
let g:screen_center_toggle_flag = 1
function! ScreenCenterToggle()
    if g:screen_center_toggle_flag == 0
        exec 'nnoremap j j'
        exec 'nnoremap k k'
        echo  '已经关闭，j和k恢复默认键位'
        let g:screen_center_toggle_flag = 1
    else
        exe 'norm! zz'
        exec 'nnoremap j jzz'
        exec 'nnoremap k kzz'
        echo  '已经启用，光标将保持在屏幕中间'
        let g:screen_center_toggle_flag = 0
    endif
endfunction


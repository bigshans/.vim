let mapleader="\<Space>"
set nocompatible
set mouse=a
set lazyredraw
set synmaxcol=200
set timeout
" set so=999
filetype off
"-----------------------*-----------------------------"
"colorscheme ui config
set cursorline "当前行高亮
set t_Co=256
" colorscheme nord
" let g:nord_italic=1
" let g:nord_italic_comments=1
" let g:nord_comment_brightness=12
" let g:nord_uniform_status_lines=1
if has('gui_running')
    set guioptions-=T
    " set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=NotoMonoforPowerline\ 11
    colorscheme one
else
    colorscheme gruvbox
endif
set background=dark
" set background=light
" colorscheme monokai-chris
"colorscheme Tomorrow-Night
" colorscheme solarized
" colorscheme gruvbox
set number relativenumber
set hlsearch
set title
syntax enable
syntax on
"允许换行
set whichwrap+=<,>,h,l
set magic
"-----------------------*-----------------------------"
"edit config
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
set listchars=eol:↩︎
"status config
set laststatus=2
set writebackup
set nobackup
let g:netrw_altv = 1
"-----------------------*-----------------------------"

command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
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


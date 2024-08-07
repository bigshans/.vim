scriptencoding UTF-8
set encoding=UTF-8
let g:mapleader = " "

filetype plugin indent on

syntax enable
syntax on
set nocompatible
set colorcolumn=120
set shortmess+=Ic
set timeoutlen=300
set nofoldenable
set virtualedit=block
set t_Co=256
" set background=dark
set number
set hlsearch
set title
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set magic
set laststatus=2
set updatetime=300
set complete-=k

function g:SetTabSize(size)
	exec 'set tabstop=' . a:size
	exec 'set softtabstop=' . a:size
	exec 'set shiftwidth=' . a:size
endfunction

call g:SetTabSize(4)
set expandtab
set wrap

set formatoptions+=mM
set smartindent
set autoindent
set list

set noswapfile
set writebackup
set nobackup
set spelllang=en,cjk
set directory=.,$TEMP
set nospell
set pumheight=20

set signcolumn=yes

set showtabline=2
set mouse=a
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e
if !has('nvim')
    set iminsert=2
endif

set showbreak=\\
set nolist

set guicursor+=a:blinkon0

set termguicolors
set vb t_vb=
au GUIEnter * set t_vb=

if has("win32")
    " set shell=pwsh
    " set shellcmdflag=-c
    " set shellquote=\"
    " set shellxquote=
endif

set guifont=Cascadia_Code_NF:h11:cANSI:qDRAFT

command! C :call utils#mk_dir()
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! W :call utils#sudo_save()

command! -nargs=+ -bar PL call plugin#append(<args>)
command! -nargs=+ -bar PLL call plugin#append_lua(<args>)

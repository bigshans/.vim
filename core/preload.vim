scriptencoding UTF-8
set encoding=UTF-8
let g:mapleader = " "

filetype plugin indent on

" 语法高亮设置
syntax enable
syntax on

" set nocompatible
" 显示一列高亮行在第 120 个字符处，
" 示意单行最大宽度
set colorcolumn=120
" 信息缩写
set shortmess+=Ic
" 改回默认值
" 缩短超时时间
" set timeoutlen=300
set nofoldenable
" set foldmethod=indent
" set foldlevel=999
" set foldmarker={,}
" 设置隐藏高亮
set hidden
" 高亮当前行
set cursorline
" 鼠标闪烁
set guicursor=n-v-c:block,i-ci-ve:,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
" 设置虚拟编辑
set virtualedit=block
set t_Co=256
set background=dark
set number
set incsearch
set hlsearch
set title
set backspace=indent,eol,start
" 设置下一行跳转
set whichwrap+=<,>,h,l,[,]
set magic
set encoding=UTF-8
set fileencoding=UTF-8
scriptencoding UTF-8
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
if &wrap == 1
    set showbreak=<
    set listchars=eol:↩︎
endif

set formatoptions+=mM
set smartindent
set autoindent
set list

set noswapfile
set writebackup
set nobackup
set backupdir=/tmp
set spelllang=en,cjk
set directory=.,$TEMP
set nospell
set pumheight=20

" 菜单设置
if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=e
    set guifont=NotoMonoforPowerline\ 12
    " set guifont=Hack_Nerd_Font_Mono:h11,Cascadia_Mono_PL:h11
endif

" 符号列
set signcolumn=yes

set showtabline=2
set mouse=a

set termguicolors
set vb t_vb=
au GUIEnter * set t_vb=

command! C :call utils#mk_dir()
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! W :call utils#sudo_save()

command! -nargs=+ -bar PL call plugin#append(<args>)
command! -nargs=+ -bar PLL call plugin#append_lua(<args>)

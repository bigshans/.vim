let g:mapleader=" "

filetype plugin indent on

" 语法高亮设置
syntax enable
syntax on

set nocompatible
" 显示一列高亮行在第 120 个字符处，
" 示意单行最大宽度
set colorcolumn=120
" 信息缩写
set shm+=Ic
" 缩短超时时间
set timeoutlen=400
set ttimeoutlen=10
set nofoldenable
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
set hlsearch
set title
set backspace=indent,eol,start
" 设置下一行跳转
set whichwrap+=<,>,h,l,[,]
set magic
set encoding=UTF-8
set laststatus=2
set updatetime=300
set complete-=k
" tab 宽度设置为 4 个空格
set tabstop=4
" 设置 4 个空格相当于 1 个 tab
set softtabstop=4
" 设置 tab 和空格的转换
set shiftwidth=4
" 展开 tab 为空格
set expandtab

" 折行，大文件不折行
set wrap
if &wrap == 1
    set showbreak=<
    if !has('nvim')
        set listchars=eol:↩︎
    endif
endif

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

" 菜单设置
if has('gui_running') || exists('g:nyaovim_version')
    set guioptions-=T
    " set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=e
    set guifont=NotoMonoforPowerline\ 14
endif

" 符号列
set signcolumn=yes

if !has('nvim')
    set showtabline=2
endif

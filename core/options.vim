set encoding=UTF-8
scriptencoding UTF-8

" =============================================================================
" 基础编码设置
" =============================================================================
let g:mapleader = " "

" =============================================================================
" Windows 外部命令环境
" =============================================================================
" Vim 9.1+ 在 Windows 上会读 $SHELL，导致 &shell 随启动环境漂移：
"   从 Git Bash 启 → shell=pwsh/bash + shellcmdflag=-c + shellredir=>
"   从 cmd/PowerShell 启 → shell=cmd.exe + /c + shellredir=>%s 2>&1
" 后者才是插件（fzf/ctrlsf/fugitive/AsyncRun）普遍假定的环境，这里固定下来
if has('win32') || has('win64')
    if !empty($COMSPEC) && filereadable($COMSPEC)
        let &shell = $COMSPEC
    endif
    set shellcmdflag=/c
    set shellredir=>%s\ 2>&1
    set shellpipe=>%s\ 2>&1
    set shellxquote=(
endif

" =============================================================================
" 文件类型和语法
" =============================================================================
" filetype 由 vim-plug 的 plug#end() 统一开启，避免 filetype.vim 被加载两次
syntax on

" =============================================================================
" 编辑器基本设置
" =============================================================================
set hidden          " 允许隐藏缓冲区
set cursorline      " 高亮当前行
set number          " 显示行号
set title           " 显示标题
set mouse=a         " 启用鼠标支持
set virtualedit=block  " 虚拟编辑模式
" t_Co 在 GUI 下无意义，仅在终端里强制 256 色（Linux 下行为保持原样）
if !(has('gui_running') && (has('win32') || has('win64')))
    set t_Co=256    " 256色支持
endif
set background=dark " 深色背景
set signcolumn=yes  " 显示符号列
set showtabline=2   " 总是显示标签行

" =============================================================================
" 搜索设置
" =============================================================================
set incsearch       " 增量搜索
set hlsearch        " 高亮搜索结果
set magic           " 使用魔术模式

" =============================================================================
" 缩进和格式化
" =============================================================================
function g:SetTabSize(size)
    exec 'set tabstop=' . a:size
    exec 'set softtabstop=' . a:size
    exec 'set shiftwidth=' . a:size
endfunction

call g:SetTabSize(4)
set expandtab       " 使用空格代替制表符
set smartindent     " 智能缩进
set autoindent      " 自动缩进
set formatoptions+=mM  " 格式化选项

" =============================================================================
" 换行和显示
" =============================================================================
set wrap            " 自动换行
" if &wrap == 1
"     set showbreak=<     " 换行显示符号
"     set listchars=eol:↩︎  " 行尾符号
" endif
set nolist          " 不显示特殊字符
set colorcolumn=120 " 120列颜色标记

" =============================================================================
" 文件编码
" =============================================================================
set fileencodings=utf-8,ucs-bom,gb18030,gbk,latin1

" =============================================================================
" 键盘和导航
" =============================================================================
set backspace=indent,eol,start  " 退格键行为
set whichwrap+=<,>,h,l,[,]      " 允许换行导航
set shortmess+=Ic               " 简化消息显示

" =============================================================================
" 备份和撤销
" =============================================================================
set noswapfile      " 不使用交换文件
set writebackup     " 写入时备份
set nobackup        " 不保留备份文件
if has('win32') || has('win64')
    " 直接 set backupdir=$TMP 时：$TMP 未定义会变字面量目录，路径含空格会被拆成多项，
    " 且会整体覆盖掉默认回退列表。这里显式取值 + 转义
    let s:win_tmp = empty($TMP) ? $TEMP : $TMP
    if empty(s:win_tmp)
        let s:win_tmp = expand('~/AppData/Local/Temp')
    endif
    if !empty(s:win_tmp) && isdirectory(s:win_tmp)
        let &backupdir = escape(s:win_tmp, ' ,')
    endif
    unlet! s:win_tmp
else
    set backupdir=/tmp
endif
set pumheight=20    " 弹出菜单高度

let s:undo_path = expand($HOME_VIM . '/undodir')
if !isdirectory(s:undo_path)
    call mkdir(s:undo_path, 'p')
endif

let &undodir = s:undo_path  " 使用变量设置选项
set undofile                " 启用持久撤销

" =============================================================================
" GUI 设置
" =============================================================================
if has('gui_running')
    set guioptions-=T   " 隐藏工具栏
    set guioptions-=m   " 隐藏菜单栏
    set guioptions-=l   " 隐藏左滚动条
    set guioptions-=L   " 隐藏左滚动条
    set guioptions-=r   " 隐藏右滚动条
    set guioptions-=R   " 隐藏右滚动条
    set guioptions-=e   " 隐藏标签页工具栏
    if has('win32') || has('win64')
        set guifont=JetBrainsMono_NFM:h9:cANSI:qDRAFT
        " gvim 下 Alt+字母 默认会被菜单吃掉，导致 <M-j>/<M-k>/<M-t> 等大量映射失效
        set winaltkeys=no
    else
        set guifont=JetBrainsMono\ Nerd\ Font\ 12
    endif
endif

" =============================================================================
" 终端和视觉效果
" =============================================================================
" 终端真彩色支持；终端不支持 24 位彩色（如输出被重定向）时会抛 E954，
" 捕获后静默退回 cterm 配色，避免启动时弹「按 ENTER」
if exists('+termguicolors')
    try
        set termguicolors
    catch /^Vim\%((\a\+)\)\=:E954/
    endtry
endif
set vb t_vb=        " 禁用响铃
augroup gui_tweaks
    autocmd!
    autocmd GUIEnter * set t_vb=  " GUI启动时禁用响铃
augroup END

" =============================================================================
" 拼写检查
" =============================================================================
set spelllang=en,cjk  " 拼写检查语言
if has('win32') || has('win64')
    " 同上：避免 $TEMP 未定义 / 含空格时 directory 被拆坏
    let s:win_tmp = empty($TEMP) ? $TMP : $TEMP
    if empty(s:win_tmp)
        let s:win_tmp = expand('~/AppData/Local/Temp')
    endif
    if !empty(s:win_tmp) && isdirectory(s:win_tmp)
        let &directory = '.,' . escape(s:win_tmp, ' ,')
    endif
    unlet! s:win_tmp
else
    set directory=.,/tmp
endif
set nospell           " 默认不启用拼写检查

" =============================================================================
" 状态行和更新
" =============================================================================
set laststatus=2      " 总是显示状态行
set updatetime=100    " 更新时间间隔
set complete-=k       " 移除关键字补全
" set timeout           " 开启映射超时检测
set timeoutlen=800    " 快捷键等待 0.8 秒，兼顾手速与响应

" set ttimeout          " 开启键码超时检测
set ttimeoutlen=10    " 极速识别 Esc 和功能键，消除退出延迟

" =============================================================================
" Session
" =============================================================================

set sessionoptions=blank,buffers,curdir,folds,help,slash,tabpages,winsize

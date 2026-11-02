" 显式关闭 vi 兼容模式：用 `vim -u <此文件>` 启动时 'compatible' 默认是开的，
" 会让行续接失效（大量 E10）；正常启动时本就是 nocompatible，无副作用
set nocompatible

let s:config_home = substitute(fnamemodify(resolve(expand('<sfile>:p')), ':h'), '\\', '/', 'g')
" 先把配置目录加入 rtp，不再依赖 ~/.vim 恰好在默认 runtimepath 中
if index(split(&runtimepath, ','), s:config_home) < 0
    exec 'set rtp+=' . fnameescape(s:config_home)
endif

let $HOME_VIM = s:config_home
let $CORE_CONFIG = $HOME_VIM . '/core'

" 墨观 Inkstone 主题插件 (本地开发，不在 vim-plug 管理范围内)
let s:inkstone = $HOME_VIM . '/bundle/vim-inkstone'
if isdirectory(s:inkstone) && index(split(&runtimepath, ','), s:inkstone) < 0
    exec 'set rtp+=' . fnameescape(s:inkstone)
endif
" 含 win32unix：Git Bash 里的 /usr/bin/vim 也是原生 Windows 程序，同样需要
if has("win32") || has("win64") || has("win32unix")
    " 配置目录已由上面按 s:config_home 加入 rtp，这里不再硬编码 ~/vimfiles
    " python3 DLL 自动探测，不写死版本号/路径；已能加载 python3 时什么都不做
    call utils#init_python3()
endif

function s:load(file)
    exec 'source ' . fnameescape(utils#stdpath(a:file))
endfunction

call s:load($CORE_CONFIG.'/options.vim')
call s:load($CORE_CONFIG . '/plugins.vim')
call s:load($CORE_CONFIG . '/builtin.vim')
call s:load($CORE_CONFIG . '/theme.vim')
call s:load($CORE_CONFIG . '/commands.vim')

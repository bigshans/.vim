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
if has("win32") || has("win64")
    exec 'set rtp+=~/vimfiles'
endif

if has("win32") || has("win64")
    set pythondll=~/AppData/Local/Programs/Python/Python311/python311.dll
endif

function s:load(file)
    exec 'source ' . utils#stdpath(fnameescape(a:file))
endfunction

call s:load($CORE_CONFIG.'/options.vim')
call s:load($CORE_CONFIG . '/plugins.vim')
call s:load($CORE_CONFIG . '/builtin.vim')
call s:load($CORE_CONFIG . '/theme.vim')
call s:load($CORE_CONFIG . '/commands.vim')

let $HOME_VIM = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $CORE_CONFIG = fnameescape($HOME_VIM."/core")

exec 'set rtp+='. fnameescape($HOME_VIM)
" if has("win32") || has("win64")
"     exec 'set rtp+=~/vimfiles'
" else
"     exec 'set rtp+=~/.vim'
" endif

if has("win32") || has("win64")
    set pythondll=~/AppData/Local/Programs/Python/Python311/python311.dll
endif

function s:load(file)
    exec 'source ' . fnameescape(a:file)
endfunction

call s:load($CORE_CONFIG.'/options.vim')
call s:load($CORE_CONFIG . '/commands.vim')
call s:load($CORE_CONFIG . '/plugins.vim')
call s:load($CORE_CONFIG . '/builtin.vim')

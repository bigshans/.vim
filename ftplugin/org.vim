" Vim filetype plugin for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <alex@vear.uk>
" License:      Vim (see `:help license`)
" Location:     ftplugin/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2020-02-15
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

setlocal commentstring=#%s
setlocal comments=fb:*,fb:-,fb:+,b:#,b:\:
setlocal formatoptions+=ncqlt
let &l:formatlistpat = '^\s*\(\d\+[.)]\|[+-]\)\s\+'

setlocal foldmethod=expr
setlocal foldexpr=org#fold_expr(v:lnum)
setlocal foldtext=org#fold_text()
setlocal indentexpr=org#indent_expr(v:lnum)

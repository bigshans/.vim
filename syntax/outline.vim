" Vim syntax file for GNU Emacs' Outline mode
"
" Maintainer:   Alex Vear <alex@vear.uk>
" License:      Vim (see `:help license`)
" Location:     syntax/outline.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2020-08-24
"
" Reference Specification: GNU Emacs Manual, section 'Outline Mode'
"   GNU Info: `$ info Emacs Outline Mode`
"   Web: <https://www.gnu.org/software/emacs/manual/html_node/emacs/Outline-Mode.html>

if exists('b:current_syntax')
    finish
endif

" Enable spell check for non syntax highlighted text
syntax spell toplevel

set conceallevel=2

" Headings
syntax match outlineHeading1 /^\s*\*\{1}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading2 /^\s*\*\{2}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading3 /^\s*\*\{3}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading4 /^\s*\*\{4}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading5 /^\s*\*\{5}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading6 /^\s*\*\{6,}\s\+.*$/ keepend contains=@Spell

syntax match orgHeadlineStar1 /^\s*\zs\*\ze\s/ conceal cchar=◉ containedin=outlineHeading1 contained 

syntax match orgHeadPrefix2 /^\s*\*\{2}\s/ containedin=orgHeading2 contained contains=orgHeadlineStar2
syntax match orgHeadlineStar2 /^\s*\*\zs\*\ze\s/ conceal cchar=○ contained

syntax match orgHeadPrefix3 /^\s*\*\{3}\s/ containedin=orgHeading3 contained contains=orgHeadlineStar3
syntax match orgHeadlineStar3 /^\s*\*\{2}\zs\*\ze\s/ conceal cchar=✸ contained

syntax match orgHeadPrefix4 /^\s*\*\{4}\s/ containedin=orgHeading4 contained contains=orgHeadlineStar4
syntax match orgHeadlineStar4 /^\s*\*\{3}\zs\*\ze\s/ conceal cchar=✿  contained

syntax match orgHeadPrefix5 /^\s*\*\{5}\s/ containedin=orgHeading5 contained contains=orgHeadlineStar5
syntax match orgHeadlineStar5 /^\s*\*\{4}\zs\*\ze\s/ conceal cchar=◉  contained

syntax match orgHeadPrefix6 /^\s*\*\{6,}\s/ containedin=orgHeading6 contained contains=orgHeadlineStar6
syntax match orgHeadlineStar6 /^\s*\*\{5,}\zs\*\ze\s/ conceal cchar=* contained

syntax cluster outlineHeadingGroup contains=outlineHeading1,outlineHeading2,outlineHeading3,outlineHeading4,outlineHeading5,outlineHeading6,orgHeadlineStar1,orgHeadlineStar2,orgHeadlineStar3,orgHeadlineStar4,orgHeadlineStar5,orgHeadlineStar6

highlight Hidden guibg=#2A2F38 guifg=#2A2F38
hi def link outlineHeading1 Title
hi def link outlineHeading2 outlineHeading1
hi def link outlineHeading3 outlineHeading2
hi def link outlineHeading4 outlineHeading3
hi def link outlineHeading5 outlineHeading4
hi def link outlineHeading6 outlineHeading5
highlight def link orgHeadPrefix2 Hidden
highlight def link orgHeadPrefix3 orgHeadPrefix2
highlight def link orgHeadPrefix4 orgHeadPrefix2
highlight def link orgHeadPrefix5 orgHeadPrefix2
highlight def link orgHeadPrefix6 orgHeadPrefix2


let b:current_syntax = 'outline'

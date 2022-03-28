" Vim syntax file for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <alex@vear.uk>
" License:      Vim (see `:help license`)
" Location:     syntax/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2021-03-11
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

if exists('b:current_syntax') && b:current_syntax !=# 'outline'
    finish
endif

" Enable spell check for non syntax highlighted text
syntax spell toplevel

setl conceallevel=3

" Bold, underine, italic, etc.
syntax region orgItalic        matchgroup=orgItalicDelimiter        start="\(^\|[- '"({\]]\)\@<=\/\ze[^ ]" end="^\@!\/\([^\k\/]\|$\)\@=" keepend contains=@Spell
syntax region orgBold          matchgroup=orgBoldDelimiter          start="\(^\|[- '"({\]]\)\@<=\*\ze[^ ]" end="^\@!\*\([^\k\*]\|$\)\@=" keepend contains=@Spell
syntax region orgUnderline     matchgroup=orgUnderlineDelimiter     start="\(^\|[- '"({\]]\)\@<=_\ze[^ ]"  end="^\@!_\([^\k_]\|$\)\@="   keepend contains=@Spell
syntax region orgStrikethrough matchgroup=orgStrikethroughDelimiter start="\(^\|[ '"({\]]\)\@<=+\ze[^ ]"   end="^\@!+\([^\k+]\|$\)\@="   keepend contains=@Spell

if org#option('org_use_italics', 1)
    highlight def orgItalic term=italic cterm=italic gui=italic
else
    highlight def orgItalic term=none cterm=none gui=none
endif

highlight def orgBold term=bold cterm=bold gui=bold
highlight def orgUnderline term=underline cterm=underline gui=underline
highlight def orgStrikethrough term=strikethrough cterm=strikethrough gui=strikethrough
highlight def link orgBoldDelimiter orgBold
highlight def link orgUnderlineDelimiter orgUnderline
highlight def link orgStrikethroughDelimiter orgStrikethrough


" Options
syntax match  orgOption /^\s*#+\w\+.*$/ keepend
syntax region orgTitle matchgroup=orgOption start="\c^\s*#+TITLE:\s*" end="$" keepend oneline
highlight def link orgBlockDelimiter SpecialComment
highlight def link orgOption SpecialComment
highlight def link orgTitle Title


" Code and vervatim text
syntax region orgCode     matchgroup=orgCodeDelimiter     start="\(^\|[- '"({\]]\)\@<=\~\ze[^ ]" end="^\@!\~\([^\k\~]\|$\)\@=" keepend
syntax region orgVerbatim matchgroup=orgVerbatimDelimiter start="\(^\|[- '"({\]]\)\@<==\ze[^ ]"  end="^\@!=\([^\k=]\|$\)\@="   keepend
syntax match  org_verbatim /^\s*>.*/
syntax match  org_code     /^\s*:.*/
syntax region org_verbatim start="^\s*#+BEGIN_.*"      end="^\s*#+END_.*"      keepend contains=org_block_delimiter
syntax region org_code     start="^\s*#+BEGIN_SRC"     end="^\s*#+END_SRC"     keepend contains=org_block_delimiter
syntax region org_code     start="^\s*#+BEGIN_EXAMPLE" end="^\s*#+END_EXAMPLE" keepend contains=org_block_delimiter

highlight def link orgVerbatim Identifier
highlight def link orgVerbatimDelimiter orgVerbatim
highlight def link orgCode Statement
highlight def link orgCodeDelimiter orgCode


" Comments
syntax match  orgComment /^\s*#\s\+.*$/ keepend
syntax region orgComment matchgroup=orgBlockDelimiter start="\c^\s*#+BEGIN_COMMENT" end="\c^\s*#+END_COMMENT" keepend
highlight def link orgComment Comment


" Headings

syntax match orgHeading1 /^\s*\*\{1}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath 
syntax match orgHeading2 /^\s*\*\{2}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath
syntax match orgHeading3 /^\s*\*\{3}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath
syntax match orgHeading4 /^\s*\*\{4}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath
syntax match orgHeading5 /^\s*\*\{5}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath
syntax match orgHeading6 /^\s*\*\{6,}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo,orgMath

syntax match orgHeadlineStar1 /^\s*\zs\*\ze\s/ conceal cchar=◉ containedin=orgHeading1 contained 

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

syntax cluster orgHeadingGroup contains=orgHeading1,orgHeading2,orgHeading3,orgHeading4,orgHeading5,orgHeading6,orgHeadlineStar1,orgHeadlineStar2,orgHeadlineStar3,orgHeadlineStar4,orgHeadlineStar5,orgHeadlineStar6

syntax match orgTag /:\w\{-}:/ contained contains=orgTag
exec 'syntax keyword orgTodo contained ' . join(org#option('org_state_keywords', ['TODO', 'NEXT', 'DONE']), ' ')

highlight Hidden guibg=#2A2F38 guifg=#2A2F38

highlight def link orgHeading1 Title 
highlight def link orgHeading2 orgHeading1
highlight def link orgHeading3 orgHeading2
highlight def link orgHeading4 orgHeading3
highlight def link orgHeading5 orgHeading4
highlight def link orgHeading6 orgHeading5
highlight def link orgHeadPrefix2 Hidden
highlight def link orgHeadPrefix3 orgHeadPrefix2
highlight def link orgHeadPrefix4 orgHeadPrefix2
highlight def link orgHeadPrefix5 orgHeadPrefix2
highlight def link orgHeadPrefix6 orgHeadPrefix2
highlight def link orgTodo Todo
highlight def link orgTag Type


" Lists
syntax match orgUnorderedListMarker "^\s*[-+]\s\+" keepend contains=@Spell
syntax match orgOrderedListMarker "^\s*\d\+[.)]\s\+" keepend contains=@Spell
if org#option('org_list_alphabetical_bullets', 0)
    syntax match orgOrderedListMarker "^\s*\a[.)]\s\+" keepend contains=@Spell
endif
highlight def link orgUnorderedListMarker Statement
highlight def link orgOrderedListMarker orgUnorderedListMarker


" Timestamps
syntax match orgTimestampActive /<\d\{4}-\d\{2}-\d\{2}.\{-}>/ keepend
syntax match orgTimestampInactive /\[\d\{4}-\d\{2}-\d\{2}.\{-}\]/ keepend
highlight def link orgTimestampActive Operator
highlight def link orgTimestampInactive Comment


" Hyperlinks
syntax match orgHyperlink /\[\{2}\([^][]\{-1,}\]\[\)\?[^][]\{-1,}\]\{2}/ containedin=ALL contains=orgHyperLeft,orgHyperRight,orgHyperURL
syntax match orgHyperLeft /\[\{2}/ contained conceal
syntax match orgHyperRight /\]\{2}/ contained conceal
syntax match orgHyperURL /[^][]\{-1,}\]\[/ contains=orgHyperCentre contained conceal
syntax match orgHyperCentre /\]\[/ contained conceal

syntax cluster orgHyperlinkBracketsGroup contains=orgHyperLeft,orgHyperRight,orgHyperCentre
syntax cluster orgHyperlinkGroup contains=orgHyperlink,orgHyperURL,orgHyperlinkBracketsGroup

highlight def link orgHyperlink Underlined
highlight def link orgHyperURL String
highlight def link orgHyperCentre Comment
highlight def link orgHyperLeft Comment
highlight def link orgHyperRight Comment

" Plugin SyntaxRange: {{{1
" This only works if you have SyntaxRange installed:
" https://github.com/vim-scripts/SyntaxRange

" BEGIN_SRC
if exists('g:loaded_SyntaxRange')
  " cpp must be below c, otherwise you get c syntax hl for cpp files
  let lang_list = ['vim', 'python', 'c', 'cpp', 'haskell', 'ocaml', 'ruby', 'rust', 'html', 'sh', 'lua', 'lisp', 'go']
  for lang in lang_list
    call SyntaxRange#Include('#+BEGIN_SRC ' . lang, '#+END_SRC', lang, 'comment')
  endfor
  let lang_map = { 'emacs-lisp': 'lisp' }
  for [lang, mapLang] in items(lang_map)
    call SyntaxRange#Include('#+BEGIN_SRC ' . lang, '#+END_SRC', mapLang, 'comment')
  endfor

  " LaTeX
  call SyntaxRange#Include('\\begin[.*]{.*}', '\\end{.*}', 'tex')
  call SyntaxRange#Include('\\begin{.*}', '\\end{.*}', 'tex')
  call SyntaxRange#Include('\\\[', '\\\]', 'tex')
  call SyntaxRange#Include('\$[^$]', '\$', 'tex')
endif


let b:current_syntax = 'org'

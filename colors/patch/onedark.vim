let s:colors = onedark#GetColors()

call onedark#set_highlight('RedSign', { 'fg': s:colors.red })
call onedark#set_highlight('YellowSign', { 'fg': s:colors.yellow })
call onedark#set_highlight('GreenSign', { 'fg': s:colors.green })
call onedark#set_highlight('PurpleSign', { 'fg': s:colors.purple })
call onedark#set_highlight('BlueSign', { 'fg': s:colors.blue })

call onedark#set_highlight('Red', { 'fg': s:colors.red })
call onedark#set_highlight('Yellow', { 'fg': s:colors.yellow })
call onedark#set_highlight('Green', { 'fg': s:colors.green })
call onedark#set_highlight('Purple', { 'fg': s:colors.purple })
call onedark#set_highlight('Blue', { 'fg': s:colors.blue })
call onedark#set_highlight('DarkYellow', { 'fg': s:colors.dark_yellow })
call onedark#set_highlight('Grey', { 'fg': s:colors.comment_grey })

highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign 
highlight! link CocGitChangeSign BlueSign 
highlight! link CocGitRemovedSign RedSign 
highlight! link CocGitTopRemovedSign RedSign 
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign GreenSign

highlight! link DiffAdded Green
highlight! link DiffRemoved Red
highlight! link DiffChanged Blue
highlight! link DiffOldFile Yellow
highlight! link DiffNewFile DarkYellow
highlight! link DiffFile Purple
highlight! link DiffLine Grey
highlight! link DiffIndexLine Purple

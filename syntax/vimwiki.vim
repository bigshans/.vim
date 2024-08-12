" 更改标题颜色
hi VimwikiHeader1 guifg=#D79921
hi VimwikiHeader2 guifg=#689D6A
hi VimwikiHeader3 guifg=#B16286
hi VimwikiHeader4 guifg=#98971A
hi VimwikiHeader5 guifg=#458588
hi VimwikiHeader6 guifg=#CC241D
hi VimwikiLink guifg=#3db0e3
syn region VimwikiBlockquote start=/^\s\+/ end=/\%(\n\n\+\|\%$\)/ contains=VimwikiBold,VimwikiItalic,VimwikiLink,VimwikiLink,VimwikiHeader1,VimwikiHeader2,VimwikiHeader3,VimwikiHeader4,VimwikiHeader5,VimwikiHeader6,VimwikiList,VimwikiBoldItalicUnderline,VimwikiUnderline,VimwikiDelText,VimwikiSuperScript,VimwikiSubScript

hi VimwikiBlockquote guifg=#8c8c8c

let g:navigator["<leader>"].w = {
    \ "name": "vimwiki",
    \ "w": [":VimwikiIndex", "open vimwiki index"],
    \ "i": [":VimwikiDiaryIndex", "vimwiki diary index"],
    \ "d": [":VimwikiDeleteFile", "delete current wiki page"],
    \ "r": [":VimwikiRenameFile", "rename wiki page"],
    \ "h": [":Vimwiki2HTML", "convert current wiki page to HTML"],
    \ "H": [":Vimwiki2HTMLBrowse", "convert to HTML and open in browser"],
    \ "<leader>" : {
        \ "w": [":VimwikiMakeDiaryNote", "open today diary"],
      \ },
      \ "t": {
          \ "l": [":VimwikiToggleListItem", "toggle checkbox of a list item"],
        \ }
    \ }

nmap <leader>ww <Plug>VimwikiIndex
nmap <leader>wd <Plug>VimwikiDeleteFile
nmap <leader>wr <Plug>VimwikiRenameFile
nmap <leader>wh <Plug>Vimwiki2HTML
nmap <leader>wH <Plug>Vimwiki2HTMLBrowse
nmap <leader>w<leader>w <Plug>VimwikiMakeDiaryNote
nmap <leader>wtl <Plug>VimwikiToggleListItem

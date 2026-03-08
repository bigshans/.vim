if index(g:packs_config_list, "vim-navigator") <= 0
    finish
endif

let b:naviagtor_menu = utils#add_key_literal_prefix({
    \ "prefix": "m",
    \ "<BS>": ["-", "one directory up"],
    \ "<CR>": ["<CR>", "open a file/directory"],
    \ "s": ["s", "split"],
    \ "S": ["S", "vertical split"],
    \ "t": ["t", "open in a tab"],
    \ "j": ["gj", "quick jump menu"],
    \ "q": ["gq", "close vim-dir window"],
    \ "i": ["i", "preview file"],
    \ "D": ["D", "delete"],
    \ "R": ["R", "rename"],
    \ "C": ["C", "create directory"],
    \ "c": {
        \ "c": ["cc", "create a file in current directory"],
      \ },
      \ "A": ["A", "open an action menu"],
      \ "~": ["~", "open home directory"],
      \ ".": [".", "toggle hidden files/directories"],
      \ "x": ["x", "toggle line selection"],
      \ "X": ["X", "toggle all selection"],
      \ "p": ["p", "paste here"],
      \ "P": ["P", "move here"],
  \ })

nn <buffer>m :Navigator b:naviagtor_menu<CR>
nmap <buffer>q gq

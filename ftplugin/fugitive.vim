if index(g:packs_config_list, "git") <= 0
    finish
endif

let b:naviagtor_menu = utils#add_key_literal_prefix({
    \ "prefix": "m",
    \ "s": ["s", "stage"],
    \ "u": ["u", "unstage"],
    \ "-": ["-", "toggle stage or unstage"],
    \ "U": ["U", "Unstage everything"],
    \ "X": ["X", "discard the change under the cursor"],
    \ "=": ["=", "toggle an inline diff"],
    \ "<CR>": ["<CR>", "open the file"],
    \ "O": ["O", "new tab"],
    \ "g": {
        \ "O": ["gO", "vertical split"],
    \ },
    \ "c": {
        \ "c": ["c", "commit"],
    \ },
  \ })

nn <buffer>m :Navigator b:naviagtor_menu<CR>
nmap <buffer>q :q!<CR>
unmap <buffer>P

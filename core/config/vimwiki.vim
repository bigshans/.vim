let nested_syntaxes = {
    \ 'python': 'python',
    \ 'c++': 'cpp',
    \ 'c': 'c',
    \ 'md': 'markdown',
    \ 'vim': 'vim',
    \ 'vue': 'vue',
    \ 'js': 'javascript',
    \ 'ts': 'typescript',
    \ 'jsx': 'javascriptreact',
    \ 'tsx': 'typescriptreact',
  \ }
let notes_wiki = {}
let notes_wiki.path = '~/notes'
let g:vimwiki_list = [
    \ notes_wiki,
    \ ]
let g:vimwiki_global_ext = 0
let g:vimwiki_key_mappings = { 'global': 0, 'mouse': 1 }
" 更改复选框格式
let g:vimwiki_listsyms = ' ○◐●✓'


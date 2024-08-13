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
let notes_wiki.path = '~/notes-wiki'
let notes_wiki.ext = 'md'
let notes_wiki.syntax = 'markdown'
let g:vimwiki_list = [
    \ notes_wiki,
    \ ]
let g:vimwiki_global_ext = 0
let g:vimwiki_key_mappings = {
            \ 'global': 0,
            \ 'table_mappings': 0,
            \ 'table_format': 1,
            \ 'mouse': 1,
            \ }
" 更改复选框格式
let g:vimwiki_listsyms = ' ○◐●✓'

augroup VimwikiRemaps
    autocmd!
    " unmap tab in insert mode
    autocmd Filetype vimwiki silent! iunmap <buffer> <Tab>
    " remap table tab mappings to M-n M-p
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-n> vimwiki#tbl#kbd_tab()
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-p> vimwiki#tbl#kbd_shift_tab()
    " on enter if completion is open, complete first element otherwise use
    " default vimwiki mapping
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
augroup end

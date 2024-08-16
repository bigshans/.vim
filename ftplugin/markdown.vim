vmap <buffer> <C-b> sa*gvllsa*
nmap <buffer> <C-b> viwsa*gvllsa*

vmap <buffer> <C-i> sa*
nmap <buffer> <C-i> viwsa*

vmap <buffer> <C-d> sa~gvllsa~
vmap <buffer> <C-u> satu<CR>

vmap <buffer> <C-`> sa`
nmap <buffer> <C-`> viwsa`

vmap <buffer> <C-l> sa[f]a(
vmap <buffer> <M-l> sa(F(i[

nmap <buffer> <tab> za

setlocal colorcolumn=

let b:_navigator_markdown = {'prefix': '<leader>' }

let b:_navigator_markdown["m"] = {
            \ 'name': 'markdown...',
            \ 't': {
            \ 'name': 'table...',
            \ '=': [':TableFormat', 'table format']
            \ }
            \ }
nmap <buffer><silent><leader>mt= :Tabularize<CR>
setlocal conceallevel=2

let b:_navigator_wiki = {
            \ 'name': 'wiki...',
        \ "d": ["<plug>(wiki-page-delete)", "delete current wiki page"],
        \ "r": ["<plug>(wiki-page-rename)", "rename wiki page"],
        \ "g": {
        \'name': 'more...',
            \ "r": ["<plug>(wiki-graph-related)", "graph related"],
            \ "b": ["<plug>(wiki-find-backlinks)", "find back line"],
            \ "c": ["<plug>(wiki-graph-check-links)", "check current wiki page for broken links"],
            \ "C": ["<plug>(wiki-graph-check-links-g)", "check global broken links"],
            \ "O": ["<plug>(wiki-graph-check-orphans)", "check orphans pages"],
            \ "i": ["<plug>(wiki-graph-in)", "show links in to the current page"],
            \ "o": ["<plug>(wiki-graph-out)", "show links out of the current page"],
          \ },
          \ "f": ["<plug>(wiki-link-transform)", "transform link style"],
          \ "t": ["<plug>(wiki-toc-generate)", "generate toc"],
          \ "T": ["<plug>(wiki-toc-generate-local)", "generate section toc"],
          \ "p": ["<plug>(wiki-export)", "export wiki"],
          \ "l": {
              \ 'name': 'link',
              \ "l": ["<plug>(wiki-link-show)", "show some info under"],
              \ "h": ["<plug>(wiki-link-extract-header)", "set link titles from first header of target file"],
            \ "r": ["<plug>(wiki-link-remove)", "remove link under the cursor"],
            \ "t": [":WikiLinkTransform", "transform link style"]
            \ },
            \ "s": {
            \ "name": "tags",
            \ "r": ["<plug>(wiki-tag-reload)", "reload tags"],
            \ "l": ["<plug>(wiki-tag-list)", "show tag list"],
            \ "s": ["<plug>(wiki-tag-search)", "search tag list"],
            \ "n": ["<plug>(wiki-tag-rename)", "rename tag"],
              \ },
            \ "a": ["<plug>(wiki-link-add)", "select from the list to add a linkto that target page"]
            \ }

let b:current_folder = fnamemodify(resolve(expand('%:p')), ':h')
nn <buffer>= :HeaderIncrease<CR>
nn <buffer>- :HeaderDecrease<CR>

if stridx(fnamemodify(resolve(g:wiki_root), ':h'), b:current_folder) && exists('g:wiki_loaded')
    let b:_navigator_markdown["w"] = b:_navigator_wiki
    let b:navigator = MakeLocal(g:navigator["<leader>"], b:_navigator_markdown)
    nn <buffer><cr> <plug>(wiki-link-follow)
    nn <buffer><leader>wlt :WikiLinkTransform<CR>
    nn <buffer><tab> <plug>(wiki-link-next)
endif

let b:navigator = MakeLocal(g:navigator["<leader>"], b:_navigator_markdown)
nmap <buffer><leader> :Navigator b:navigator<CR>
setlocal conceallevel=2

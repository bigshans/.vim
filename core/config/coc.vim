" 控制 coc 插件安装
let g:coc_global_extensions = [
            \ '@yaegassy/coc-intelephense',
            \ '@yaegassy/coc-volar',
            \ '@yaegassy/coc-volar-tools',
            \ 'coc-angular',
            \ 'coc-calc',
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-css',
            \ 'coc-deno',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-go',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-omnisharp',
            \ 'coc-pyright',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-stylua',
            \ 'coc-svelte',
            \ 'coc-tabnine',
            \ 'coc-toml',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-xml',
            \ 'coc-yank',
            \]

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ "\<TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
augroup custom_nginx
    autocmd!
    autocmd FileType nginx setlocal iskeyword+=$
    autocmd FileType nginx let b:coc_additional_keywords = ['$']
augroup end

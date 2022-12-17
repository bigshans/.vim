let g:coc_global_extensions = [
            \ 'coc-explorer',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-solargraph',
            \ 'coc-json',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-deno',
            \ 'coc-svelte',
            \ 'coc-calc',
            \ 'coc-vimlsp',
            \ 'coc-toml',
            \ 'coc-xml',
            \ '@yaegassy/coc-volar',
            \ '@yaegassy/coc-intelephense',
            \ 'coc-marketplace',
            \ 'coc-translator',
            \ 'coc-tabnine',
            \ 'coc-highlight',
            \ 'coc-stylua',
            \ 'coc-go',
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

autocmd CursorHold * silent call CocActionAsync('highlight')
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

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

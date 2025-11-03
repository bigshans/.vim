if has('win32') || has('win64')
    let g:coc_config_home = fnameescape('~/vimfiles/win-coc')
    let g:coc_node_path = fnameescape('~/AppData/Roaming/nvm/v22.14.0/node.exe')
endif

" 控制 coc 插件安装
let g:coc_global_extensions = [
            \ '@yaegassy/coc-volar',
            \ 'coc-calc',
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-css',
            \ 'coc-deno',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-go',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-stylua',
            \ 'coc-svelte',
            \ 'coc-toml',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-xml',
            \ 'coc-yank',
            \ 'coc-unocss',
            \]

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ "\<TAB>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

let g:AutoPairsMapCR = 0
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<Plug>AutoPairsReturn"
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

"" if only one buffer named 'coc-explorer' is shown, then exit
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | bd! | endif

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" ================================
" 自动检测 Vue 版本 + 切换项目重置
" ================================

let g:vue_detect_done = 0

function! DetectVueVersion()
  let l:package_json = findfile('package.json', '.;')
  if empty(l:package_json)
    return ''
  endif

  try
    let l:content = join(readfile(l:package_json), "\n")
  catch
    return ''
  endtry

  if l:content =~ '"vue" *: *"[^"]*2\.'      " Vue 2.x
    return 'vue2'
  elseif l:content =~ '"vue" *: *"[^"]*3\.'  " Vue 3.x
    return 'vue3'
  else
    return ''
  endif
endfunction

function! LazySetupCocVue()
  " 只在当前项目检测一次
  if g:vue_detect_done
    return
  endif
  let g:vue_detect_done = 1

  let l:version = DetectVueVersion()

  if l:version == 'vue2'
    echo "[coc.nvim] Detected Vue 2 project → enable coc-vetur"
    call coc#config('vetur', { 'enable': v:true })
  elseif l:version == 'vue3'
    echo "[coc.nvim] Detected Vue 3 project → enable coc-volar"
    call coc#config('vetur', { 'enable': v:false })
  else
    " don't do any thing
    " echo "[coc.nvim] Vue version not detected → enable coc-volar"
    " call coc#config('volar', { 'enable': v:false })
    " call coc#config('vetur', { 'enable': v:true })
  endif
endfunction

" 当第一次打开 .vue 文件时执行检测
autocmd BufReadPost *.vue call LazySetupCocVue()

" 每当切换工作目录时，重置检测标记
autocmd DirChanged * let g:vue_detect_done = 0

let mapleader=" "
nmap <leader>q :q!<CR>
nmap <leader>fs :w<CR>
nmap <leader>fe :enew<CR>
xmap <leader>ci  <Plug>VSCodeCommentary
nmap <leader>cc  <Plug>VSCodeCommentary
omap <leader>ci  <Plug>VSCodeCommentary
nmap <leader>ci <Plug>VSCodeCommentaryLine
nmap <leader>ft :call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>
nmap gr :call VSCodeNotify("editor.action.goToReferences")<CR>
nmap P "+p
vmap Y "+y

call plug#begin('~/.vim/bundle')

Plug 'machakann/vim-sandwich'
Plug 'unblevable/quick-scope'

call plug#end()

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none

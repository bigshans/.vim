call plug#begin('~/.vim/bundle')

P 'whichkey', 'liuchengxu/vim-which-key'
P 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
P 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
P 'fzf', 'junegunn/fzf.vim'
P 'lambdalisue/suda.vim'
P 'fcitx', 'bigshans/fcitx.vim'
P 'grammarous', 'bigshans/vim-grammarous'
P 'cycle', 'bigshans/vim-cycle'
P 'liuchengxu/vista.vim'
if !has('nvim')
    P 'drmikehenry/vim-fixkey'
    P 'nerdcomment', 'preservim/nerdcommenter'
    P 'LunarWatcher/auto-pairs'
endif

P 'https://github.com/honza/vim-snippets.git'
P 'sandwich', 'machakann/vim-sandwich'
P 'interestingwords', 'lfv89/vim-interestingwords'
P 'https://github.com/kien/rainbow_parentheses.vim.git'
P 'autoformat', 'vim-autoformat/vim-autoformat'

P 't9md/vim-choosewin'
P 'tpope/vim-fugitive'

" Appearance
P 'ryanoasis/vim-devicons'
P 'sainnhe/artify.vim'
P 'josa42/vim-lightline-coc'
P 'albertomontesg/lightline-asyncrun'
P 'sonokai', 'sainnhe/sonokai'
if !has('nvim')
    " conflict with bufferline
    P 'lightline-bufferline', 'mengelbrecht/lightline-bufferline'
endif
P 'lightline', 'itchyny/lightline.vim'

P 'godlygeek/tabular', { 'for': 'markdown' }
P 'preservim/vim-markdown', { 'for': 'markdown' }
P 'chrisbra/NrrwRgn', { 'for': 'markdown' }

P 'multi', 'mg979/vim-visual-multi',{'branch':'test'}

if has('nvim')
    P 'kevinhwang91/rnvimr'
    P 'michaelb/sniprun', {'do': 'bash install.sh'}
    " dep by todo-comments
    P 'nvim-lua/plenary.nvim'

    PL 'nvim-tree/nvim-web-devicons'
    PL 'npairs', 'windwp/nvim-autopairs'
    PL 'bufferline', 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
    PL 'comment', 'numToStr/Comment.nvim'
    PL 'todo_comments', 'folke/todo-comments.nvim'
    PL 'cscope_maps', 'dhananjaylatkar/cscope_maps.nvim'
endif

call p#end()

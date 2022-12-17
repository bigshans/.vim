call plug#begin('~/.vim/bundle')

echo exists('Plug')

P 'whichkey', 'liuchengxu/vim-which-key'
P 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
" 使用 Plug 来 load fzf
P 'fzfp', 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
P 'fzf', 'junegunn/fzf.vim'
P 'suda', 'lambdalisue/suda.vim'
P 'bigshans/fcitx.vim'


P 'https://github.com/honza/vim-snippets.git'
P 'emmet', 'mattn/emmet-vim'
P 'sandwich', 'machakann/vim-sandwich'
P 'interestingwords', 'lfv89/vim-interestingwords'
P 'https://github.com/kien/rainbow_parentheses.vim.git'

P 't9md/vim-choosewin'
P 'git', 'tpope/vim-fugitive'
P 'kevinhwang91/rnvimr'

P 'ryanoasis/vim-devicons'
P 'sainnhe/artify.vim'
P 'josa42/vim-lightline-coc'
P 'albertomontesg/lightline-asyncrun'
P 'sonokai', 'sainnhe/sonokai'
P 'lightline', 'itchyny/lightline.vim'

P 'tabular', 'godlygeek/tabular', { 'for': 'markdown' }
P 'markdown', 'preservim/vim-markdown', { 'for': 'markdown' }
P 'rgn', 'chrisbra/NrrwRgn', { 'for': 'markdown' }

P 'multi', 'mg979/vim-visual-multi',{'branch':'test'}
P 'sniprun', 'michaelb/sniprun', {'do': 'bash install.sh'}

PL 'kyazdani42/nvim-web-devicons'
PL 'npairs', 'windwp/nvim-autopairs'
PL 'bufferline', 'akinsho/bufferline.nvim', { 'tag': '*' }
PL 'comment', 'numToStr/Comment.nvim'
PL 'todo_comments', 'folke/todo-comments.nvim'

call p#end()

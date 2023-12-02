call plug#begin('~/.vim/bundle')

P 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
P 'leaderf', 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
P 'lambdalisue/suda.vim'
if !has('win32') && !has('win64')
    P 'fcitx', 'bigshans/fcitx.vim'
endif
P 'cycle', 'bigshans/vim-cycle'
P 'liuchengxu/vista.vim'
P 'drmikehenry/vim-fixkey'
P 'nerdcomment', 'preservim/nerdcommenter'
P 'LunarWatcher/auto-pairs'

P 'MattesGroeger/vim-bookmarks'
P 'https://github.com/honza/vim-snippets.git'
P 'easy-motion', 'easymotion/vim-easymotion'
P 'sandwich', 'machakann/vim-sandwich'
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
P 'vimgitgutter', 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
P 'lightline-bufferline', 'mengelbrecht/lightline-bufferline'
P 'lightline', 'itchyny/lightline.vim'
P 'skywind3000/vim-quickui'
P 'vim-navigator', 'skywind3000/vim-navigator'
P 'purescript-contrib/purescript-vim'
P 'tpope/vim-speeddating'

P 'godlygeek/tabular', { 'for': 'markdown' }
P 'preservim/vim-markdown', { 'for': 'markdown' }
P 'chrisbra/NrrwRgn', { 'for': 'markdown' }

P 'tpope/vim-repeat'
P 'romainl/vim-cool'

call p#end()

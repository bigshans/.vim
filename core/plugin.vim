call plug#begin('~/.vim/bundle')

P 'whichkey', 'liuchengxu/vim-which-key'
P 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
P 'leaderf', 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
P 'lambdalisue/suda.vim'
P 'fcitx', 'bigshans/fcitx.vim'
P 'cycle', 'bigshans/vim-cycle'
P 'liuchengxu/vista.vim'
P 'drmikehenry/vim-fixkey'
P 'nerdcomment', 'preservim/nerdcommenter'
P 'LunarWatcher/auto-pairs'

P 'MattesGroeger/vim-bookmarks'
P 'https://github.com/honza/vim-snippets.git'
P 'easy-motion', 'easymotion/vim-easymotion'
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
P 'vimgitgutter', 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
P 'lightline-bufferline', 'mengelbrecht/lightline-bufferline'
P 'lightline', 'itchyny/lightline.vim'

P 'godlygeek/tabular', { 'for': 'markdown' }
P 'preservim/vim-markdown', { 'for': 'markdown' }
P 'chrisbra/NrrwRgn', { 'for': 'markdown' }

P 'multi', 'mg979/vim-visual-multi',{'branch':'test'}

call p#end()

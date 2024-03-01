call plug#begin('~/.vim/bundle')

PL 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
PL 'leaderf', 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
PL 'lambdalisue/suda.vim'
if !has('win32') && !has('win64')
    PL 'fcitx', 'bigshans/fcitx.vim'
endif
PL 'cycle', 'bigshans/vim-cycle'
PL 'vista', 'liuchengxu/vista.vim'
PL 'drmikehenry/vim-fixkey'
PL 'nerdcomment', 'preservim/nerdcommenter'
" PL 'jiangmiao/auto-pairs'
PL 'skywind3000/vim-color-patch'

PL 'MattesGroeger/vim-bookmarks'
PL 'https://github.com/honza/vim-snippets.git'
PL 'easy-motion', 'easymotion/vim-easymotion'
PL 'sandwich', 'machakann/vim-sandwich'
PL 'https://github.com/kien/rainbow_parentheses.vim.git'
PL 'autoformat', 'vim-autoformat/vim-autoformat'

PL 't9md/vim-choosewin'
PL 'tpope/vim-fugitive'

" Appearance
PL 'ryanoasis/vim-devicons'
PL 'sainnhe/artify.vim'
PL 'josa42/vim-lightline-coc'
PL 'albertomontesg/lightline-asyncrun'
" PL 'sonokai', 'sainnhe/sonokai'
PL 'vimgitgutter', 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
PL 'sheerun/vim-polyglot'
PL 'onedark', 'joshdick/onedark.vim'
PL 'lightline-bufferline', 'mengelbrecht/lightline-bufferline'
PL 'lightline', 'itchyny/lightline.vim'
PL 'skywind3000/vim-quickui'
PL 'vim-navigator', 'skywind3000/vim-navigator'
PL 'purescript-contrib/purescript-vim'
PL 'tpope/vim-speeddating'

PL 'godlygeek/tabular', { 'for': 'markdown' }
PL 'preservim/vim-markdown', { 'for': 'markdown' }
PL 'chrisbra/NrrwRgn', { 'for': 'markdown' }

PL 'tpope/vim-repeat'
PL 'romainl/vim-cool'

call plugin#end()

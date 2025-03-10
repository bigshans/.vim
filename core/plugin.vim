call plug#begin('~/.vim/bundle')

PL 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
PL 'leaderf', 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
PL 'lambdalisue/suda.vim'
if !has('win32') || !has('win64')
    PL 'fcitx', 'bigshans/fcitx.vim'
    " PL 'ranger', 'francoiscabrol/ranger.vim'
endif
PL 'cycle', 'bigshans/vim-cycle'
PL 'vista', 'liuchengxu/vista.vim'
" PL 'drmikehenry/vim-fixkey'
PL 'tomtom/tcomment_vim'
PL 'skywind3000/vim-color-patch'

PL 'MattesGroeger/vim-bookmarks'
PL 'https://github.com/honza/vim-snippets.git'
PL 'easy-motion', 'easymotion/vim-easymotion'
PL 'sandwich', 'machakann/vim-sandwich'
PL 'https://github.com/kien/rainbow_parentheses.vim.git'
PL 'autoformat', 'vim-autoformat/vim-autoformat'

PL 't9md/vim-choosewin'
PL 'tpope/vim-fugitive'
" PL 'ale', 'bigshans/ale'

" Appearance
PL 'ryanoasis/vim-devicons'
" PL 'sainnhe/artify.vim'
" PL 'josa42/vim-lightline-coc'
" PL 'albertomontesg/lightline-asyncrun'
" PL 'sonokai', 'sainnhe/sonokai'
" PL 'sheerun/vim-polyglot'
" PL 'lightline-bufferline', 'mengelbrecht/lightline-bufferline'
" PL 'lightline', 'itchyny/lightline.vim'
PL 'airline', 'vim-airline/vim-airline'
PL 'vim-airline/vim-airline-themes'
" PL 'onedark', 'joshdick/onedark.vim'
PL 'vimgitgutter', 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
PL 'vim-navigator', 'skywind3000/vim-navigator'
PL 'skywind3000/vim-quickui'
PL 'purescript-contrib/purescript-vim'
PL 'tpope/vim-speeddating'

PL 'godlygeek/tabular', { 'for': 'markdown' }
PL 'markdown', 'preservim/vim-markdown', { 'for': 'markdown' }
PL 'chrisbra/NrrwRgn'

PL 'tpope/vim-repeat'
PL 'romainl/vim-cool'

PL 'wakatime/vim-wakatime'
PL 'prisma/vim-prisma'
PL 'chemzqm/wxapp.vim'
PL 'voldikss/vim-floaterm'
PL 'leafOfTree/vim-vue-plugin'
PL 'vim-project', 'leafOfTree/vim-project'
PL 'wiki', 'bigshans/wiki.vim'
PL 'junegunn/fzf.vim'
PL 'kaarmu/typst.vim'
PL 'inkarkat/vim-SyntaxRange'
PL 'vim-scripts/utl.vim'
PL 'jceb/vim-orgmode'
PL 'rhysd/clever-f.vim'
PL 'catppuccin/vim', { 'as': 'catppuccin' }
PL 'autopairs', 'LunarWatcher/auto-pairs'
PL 'vim-closetag', 'alvan/vim-closetag'
" PL 'jeffkreeftmeijer/vim-numbertoggle'
PL 'mileszs/ack.vim'
PL 'voldikss/LeaderF-floaterm'
PL 'junegunn/fzf'
PL 'fzf', 'junegunn/fzf.vim'
" required by vim-session
PL 'xolox/vim-misc'
PL 'vim-session', 'xolox/vim-session'
PL 'matchup', 'andymass/vim-matchup'
PL 'startify', 'mhinz/vim-startify'
" PL 'wsdjeg/FlyGrep.vim'
" PL 'yegappan/greplace'

" PL 'vimwiki', 'vimwiki/vimwiki'
" PL 'codeium', 'Exafunction/codeium.vim'
" PL 'ludovicchabant/vim-gutentags'
" PL 'gutentags_plus', 'skywind3000/gutentags_plus'

call plugin#end()

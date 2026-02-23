call plug#begin($HOME_VIM . '/bundle')

PA 'coc', 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
PA 'leaderf', 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
PA 'lambdalisue/suda.vim'
if !has('win32') && !has('win64')
    PA 'fcitx', 'bigshans/fcitx.vim'
endif
PA 'cycle', 'bigshans/vim-cycle'
PA 'vista', 'liuchengxu/vista.vim'
PA 'drmikehenry/vim-fixkey'
PA 'tomtom/tcomment_vim'
PA 'skywind3000/vim-color-patch'

PA 'jiangmiao/auto-pairs'
PA 'MattesGroeger/vim-bookmarks'
PA 'https://github.com/honza/vim-snippets.git'
PA 'easy-motion', 'easymotion/vim-easymotion'
PA 'sandwich', 'machakann/vim-sandwich'
PA 'https://github.com/kien/rainbow_parentheses.vim.git'
PA 'autoformat', 'vim-autoformat/vim-autoformat'

PA 't9md/vim-choosewin'
PA 'tpope/vim-fugitive'

" Appearance
PA 'ryanoasis/vim-devicons'
PA 'sainnhe/artify.vim'
PA 'airline', 'vim-airline/vim-airline'
PA 'vim-airline/vim-airline-themes'
PA 'vimgitgutter', 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
PA 'onedark', 'joshdick/onedark.vim'
PA 'skywind3000/vim-quickui'
PA 'vim-navigator', 'skywind3000/vim-navigator'
PA 'purescript-contrib/purescript-vim'
PA 'tpope/vim-speeddating'

PA 'godlygeek/tabular', { 'for': 'markdown' }
PA 'markdown', 'preservim/vim-markdown', { 'for': 'markdown' }
PA 'chrisbra/NrrwRgn'

PA 'tpope/vim-repeat'
PA 'romainl/vim-cool'

PA 'wakatime/vim-wakatime'
PA 'prisma/vim-prisma'
PA 'chemzqm/wxapp.vim'
PA 'voldikss/vim-floaterm'
PA 'leafOfTree/vim-vue-plugin'
PA 'vim-project', 'leafOfTree/vim-project'
PA 'junegunn/fzf.vim'
PA 'inkarkat/vim-SyntaxRange'
PA 'vim-scripts/utl.vim'
PA 'jceb/vim-orgmode'
PA 'clever-f', 'rhysd/clever-f.vim'
PA 'joplin', 'tenfyzhong/joplin.vim/'
PA 'iceberg', 'cocopon/iceberg.vim'
PA 'catppuccin/vim', { 'as': 'catppuccin' }
PA 'mileszs/ack.vim'
PA 'voldikss/LeaderF-floaterm'
PA 'junegunn/fzf'
PA 'fzf', 'junegunn/fzf.vim'

" required by vim-session
PA 'xolox/vim-misc'
PA 'vim-session', 'xolox/vim-session'

call plugin#end()

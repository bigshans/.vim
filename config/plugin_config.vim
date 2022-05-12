filetype plugin indent on
" -----------------------*-----------------------------"

" {{ value define

let g:ctrlspace = 1
let g:plug_threads = 25
let g:plug_timeout = 55
let g:vim_lightline_artify = 1
let g:vim_mode = 'full'
let g:vimspector_enable_mappings = 'HUMAN'

" }}


call plug#begin('~/.vim/bundle')

Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/artify.vim'
" Plug 'vim-ruby/vim-ruby'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'scrooloose/nerdcommenter'
" Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'bigshans/fcitx.vim'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-multiple-cursors'
Plug 'rakr/vim-one'
Plug 'mattn/emmet-vim'
" Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/gko/vim-coloresque.git'
" Plug 'marijnh/tern_for_vim'
Plug 'lfv89/vim-interestingwords'
Plug 'maksimr/vim-jsbeautify'
Plug 'brooth/far.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'thinca/vim-quickrun'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/calendar-vim'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'tpope/vim-repeat'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating' " vim-orgmode的依赖
" Plug 'bigshans/VimOrganizer'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'terryma/vim-expand-region'
Plug 'danro/rename.vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
Plug 'hail2u/vim-css3-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-choosewin'
Plug 'vimwiki/vimwiki' , {'for' : ['wiki']}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi',{'branch':'test'}
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'ryanoasis/vim-devicons' " 太卡了
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim'
Plug 'arrufat/vala.vim'
Plug 'voldikss/vim-floaterm'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'voldikss/vim-translator'
Plug 'joshdick/onedark.vim'
Plug 'kamykn/spelunker.vim', { 'for': '*' }
Plug 'bkad/CamelCaseMotion'
Plug 'honza/vim-snippets'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'preservim/vim-markdown'
Plug 'othree/xml.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'ollykel/v-vim'
Plug 'gcmt/wildfire.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'josa42/vim-lightline-coc'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'jdhao/better-escape.vim'
" Plug 'Yggdroot/indentLine'
Plug 'bigshans/coc-projector', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'bigshans/vim-code-runner'
Plug 'tpope/vim-unimpaired'
Plug 'bigshans/rel.vim'
Plug 'bigshans/findr.vim'
Plug 'vn-ki/coc-clap'
" Plug 'lambdalisue/fern.vim'

" pure nvim plugin for nvim
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-orgmode/orgmode'
    Plug 'windwp/nvim-autopairs'
    Plug 'akinsho/org-bullets.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'phaazon/hop.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'bigshans/dashboard-nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'dstein64/nvim-scrollview'
endif
" Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

" {{ call config function

call config#NERDCommenterConfig()
" call config#StartifyConfig()
call config#VimMulipleCursorsConfig()
call config#EmmetConfig()
call config#VimInterestingwordConfig()
call config#VimOrgConfig()
call config#VimAutoformatConfig()
call config#VimQuickrunConfig()
call config#FZFConfig()
call config#VimSyntaxRangeConfig()
call config#NrrwRgnConfig()
call config#VimOrgConfig()
call config#UndotreeConfig()
call config#RainbowParenthessConfig()
call config#VimExpandRegionConfig()
call config#NERDTreeGitPluginConfig()
call config#EasymotionConfig()
call config#VimFollowMyLeadConfig()
call config#VimClosetagConfig()
call config#WhichKeyConfig()
call config#CocConfig()
call config#VimNotesConfig()
call config#VimRubyConfig()
call config#BetterWhiteSpace()
call config#VistaConfig()
call config#VisualMuliti()
call config#ClapConfig()
call config#VimDeviconsConfig()
call config#CamelCaseMotion()
call config#VimMarkdownConfig()
call config#SpaceVimDarkConfig()
call config#Sonokai()
call config#SpelunkerConfig()
call config#Lightline()
call config#Wildfire()
call config#BetterEscape()
" call config#VimOrganizerConfig()
call config#Sandwich()
" call config#IndentLineConfig()
call config#CodeRunnerConfig()
call config#AutoPairsConfig()
call config#VimClosetagConfig()
call config#RelConfig()
call config#FastFoldConfig()
call config#Dashboard()

let g:mw_no_mappings = 1

if has('nvim')
    lua require 'config'
endif

" }}

" 用于测试插件
" set runtimepath^=/projects/aerian/wp/coc-kite-cmp
" set runtimepath^=/projects/aerian/wp/org-mode
" {{ autocmd

autocmd BufNew,BufEnter *.java execute "silent! CocDisable"
autocmd BufLeave *.java execute "silent! CocEnable"
au BufRead,BufNew,BufEnter,BufLeave *.js setfiletype javascript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.art set filetype=html
" }}

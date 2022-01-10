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

Plug 'git://github.com/flazz/vim-colorschemes.git'
Plug 'sainnhe/artify.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'lilydjwg/fcitx.vim'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-multiple-cursors'
Plug 'rakr/vim-one'
Plug 'mattn/emmet-vim'
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/gko/vim-coloresque.git'
Plug 'marijnh/tern_for_vim'
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
" Plug 'axvr/org.vim'
Plug 'git@github.com:bigshans/vim-orgmode.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'terryma/vim-expand-region'
Plug 'danro/rename.vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
Plug 'hail2u/vim-css3-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-choosewin'
Plug 'weilbith/nerdtree_choosewin-plugin'
Plug 'vimwiki/vimwiki' , {'for' : ['wiki']}
Plug 'ktonga/vim-follow-my-lead'
Plug 'alvan/vim-closetag'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'asins/vimcdoc'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi',{'branch':'test'}
Plug 'itchyny/vim-cursorword'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'ryanoasis/vim-devicons' " 太卡了
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim'
Plug 'arrufat/vala.vim'
Plug 'vim-scripts/sessionman.vim'
Plug 'voldikss/vim-floaterm'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'voldikss/vim-translator'
Plug 'joshdick/onedark.vim'
Plug 'kamykn/spelunker.vim', { 'for': '*' }
Plug 'bkad/CamelCaseMotion'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'plasticboy/vim-markdown'
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


call plug#end()

" {{ call config function

call g:NERDCommenterConfig()
call g:StartifyConfig()
call g:VimMulipleCursorsConfig()
call g:EmmetConfig()
call g:VimInterestingwordConfig()
call g:VimOrgConfig()
call g:VimAutoformatConfig()
call g:VimQuickrunConfig()
call g:FZFConfig()
call g:VimSyntaxRangeConfig()
call g:NrrwRgnConfig()
call g:VimOrgConfig()
call g:UndotreeConfig()
call RainbowParenthessConfig()
call g:VimExpandRegionConfig()
call g:NERDTreeGitPluginConfig()
call g:EasymotionConfig()
call g:VimFollowMyLeadConfig()
call g:VimClosetagConfig()
call g:WhichKeyConfig()
call g:CocConfig()
call g:VimNotesConfig()
call g:VimRubyConfig()
call g:BetterWhiteSpace()
call g:VistaConfig()
call g:VisualMuliti()
call g:ClapConfig()
call g:VimDeviconsConfig()
call g:CamelCaseMotion()
call g:VimMarkdownConfig()
call g:SpaceVimDarkConfig()
call g:Sonokai()
call g:SpelunkerConfig()
call g:Lightline()
call g:Wildfire()
call g:BetterEscape()

" }}

" {{ autocmd

autocmd BufNew,BufEnter *.java execute "silent! CocDisable"
autocmd BufLeave *.java execute "silent! CocEnable"
au BufRead,BufNew,BufEnter,BufLeave *.js setfiletype javascript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.art set filetype=html

" }}

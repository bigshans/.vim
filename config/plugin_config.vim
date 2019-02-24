filetype plugin indent on 
" -----------------------*-----------------------------" 
source $HOME/.vim/config/basic.vim
source $HOME/.vim/config/config_func.vim
let g:ctrlspace = 1
let g:plug_threads = 25
let g:plug_timeout = 55
let g:deoplete = 0

call plug#begin('~/.vim/bundle')

Plug 'git://github.com/scrooloose/nerdtree.git', {'on': 'NERDTreeToggle'}
call g:NERDTreeConfig()
Plug 'git://github.com/flazz/vim-colorschemes.git'
" Plug 'git://github.com/Valloric/YouCompleteMe.git'
Plug 'Valloric/YouCompleteMe', {'for': ['java']}
call g:YcmConfig()
Plug 'rdnetto/YCM-Generator',{'branch':'stable'}
Plug 'vim-ruby/vim-ruby'
call g:VimRubyConfig()
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" call g:PymodeConfig()
" Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
" Plug 'artur-shaik/vim-javacomplete2', {'on':[], 'for': ['java', 'jsp']}
" call g:Javacomplete2Config()
" Plug '~/.vim/bundle/eclim'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'SirVer/ultisnips'
call g:UltiSnipsConfig()
Plug 'scrooloose/nerdcommenter'
call g:NERDCommenterConfig()
" Plug 'Yggdroot/indentLine'
" call g:IndentLineConfig()
Plug 'https://github.com/mhinz/vim-startify.git'
call g:StartifyConfig()
Plug 'lilydjwg/fcitx.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
call g:AirlineConfig()
Plug 'terryma/vim-multiple-cursors'
call g:VimMulipleCursorsConfig()
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
call g:NordVimConfig()
Plug 'mattn/emmet-vim'
" Plug 'sillybun/vim-repl'
Plug 'git://github.com/jiangmiao/auto-pairs.git'
call g:AutoPairConfig()
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/w0rp/ale.git'
call g:AleConfig()
Plug 'https://github.com/gko/vim-coloresque.git'
Plug 'marijnh/tern_for_vim'
Plug 'lfv89/vim-interestingwords'
call g:VimInterestingwordConfig()
Plug '~/.vim/bundle/project'
Plug 'maksimr/vim-jsbeautify'
Plug 'othree/javascript-libraries-syntax.vim'
call g:VimOrgConfig()
Plug 'majutsushi/tagbar'
Plug 'brooth/far.vim'
Plug 'Chiel92/vim-autoformat'
call g:VimAutoformatConfig()
Plug 'thinca/vim-quickrun'
call g:VimQuickrunConfig()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call g:FZFConfig()
Plug 'mattn/calendar-vim'
" Plug 'vim-scripts/SyntaxRange'
Plug 'inkarkat/vim-SyntaxRange'
call g:VimSyntaxRangeConfig()
Plug 'tpope/vim-repeat'
Plug 'chrisbra/NrrwRgn'
call g:NrrwRgnConfig()
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating' " vim-orgmode的依赖
Plug 'jceb/vim-orgmode'
call g:VimOrgConfig()
" Plug 'SpaceVim/org-mode'
" Plug 'bigshans/VimOrganizer'
" call g:VimOrganizerConfig()
Plug 'godlygeek/tabular' "必须在markdown插件之前
" Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/mbbill/undotree.git'
call g:UndotreeConfig()
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
call RainbowParenthessConfig()
Plug 'terryma/vim-smooth-scroll'
Plug 'terryma/vim-expand-region'
call g:VimExpandRegionConfig()
Plug 'danro/rename.vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
Plug 'hail2u/vim-css3-syntax'
if g:deoplete == 1
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
        Plug 'roxma/nvim-yarp', {'on' : []}
        Plug 'roxma/vim-hug-neovim-rpc' , {'on' : []}
    else
        Plug 'Shougo/deoplete.nvim'
        call g:DeopleteConfig()
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
    Plug 'carlitux/deoplete-ternjs', {'do':'npm install -g tern'}
    call g:DeopleteTernConfig()
    Plug 'zchee/deoplete-clang'
    call g:DeopleteClangConfig()
    " Plug 'Shougo/neoinclude.vim'
    " Plug 'Shougo/deoplete-clangx'
    Plug 'zchee/deoplete-jedi'
    call g:DeopleteJediConfig()
endif
" if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for':['vue',]}
    " call g:DeopleteConfig()
    " Plug 'roxma/nvim-yarp', {'on' : []}
    " Plug 'roxma/vim-hug-neovim-rpc' , {'on' : []}
" else
    " Plug 'Shougo/deoplete.nvim', {'for':['vue',]}
    " Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif
let g:deoplete#enable_at_startup = 1
" Plug 'autozimu/LanguageClient-neovim', {
" \ 'branch': 'next',
" \ 'do': 'bash install.sh'}
" call g:LanguageClientConfig()
Plug 'Shougo/echodoc.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
call g:NERDTreeGitPluginConfig()
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
call g:EasymotionConfig()
Plug 't9md/vim-choosewin'
Plug 'weilbith/nerdtree_choosewin-plugin'
Plug 'vimwiki/vimwiki' , {'for' : ['wiki']}
Plug 'ktonga/vim-follow-my-lead'
call g:VimFollowMyLeadConfig()
" Plug 'hecal3/vim-leader-guide'
" call g:VimLeaderGuideConfig()
Plug 'Shougo/context_filetype.vim'
call g:ContextFiletypeConfig()
Plug 'othree/csscomplete.vim'
call g:CssCompleteConfig()
Plug 'alvan/vim-closetag'
call g:VimClosetagConfig()
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'Flowerowl/ici.vim'
" Plug 'Shougo/deoplete-lsp'
Plug 'neomake/neomake'
if g:ctrlspace == 1
    Plug 'vim-ctrlspace/vim-ctrlspace'
endif
Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/vim-which-key'
call g:WhichKeyConfig()
Plug 'asins/vimcdoc'
Plug 'mikelue/vim-maven-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()},
            \ }
call g:CocConfig()
" Plug 'sheerun/vim-polyglot'
Plug 'rustushki/JavaImp.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
call g:VimNotesConfig()
" Plug 'osyo-manga/vim-precious'
" Plug 'ervandew/supertab',{'for': 'vue'}
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'pdavydov108/vim-lsp-cquery'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" call VimLspConfig()
" Plug 'Quramy/tsuquyomi'
" Plug 'liuchengxu/eleline.vim'
" Plug 'icymind/NeoSolarized'
" Plug 'ryanoasis/vim-devicons' " 太卡了
" call g:VimDeviconsConfig()

call plug#end()
call g:SpaceVimDarkConfig()

" augroup coc
    " au!
    " au FileType vue,html,css,json,c,cpp,sh,zsh call CocConfig()
    " autocmd BufNew,BufEnter *.json,*.css,*.html,*.vue,*.c,*.cpp,*.h,*.cxx,*.sh,*.zsh,.zshrc execute "silent! CocEnable"
    " autocmd BufLeave *.json,*.vue,*.html,*.c,*.cpp,*.h,*.cxx,*.sh,*.zsh,.zshrc execute "silent! CocDisable"
" augroup END
autocmd BufNew,BufEnter *.java execute "silent! CocDisable"
autocmd BufLeave *.java execute "silent! CocEnable"
au BufRead,BufNew,BufEnter,BufLeave *.js setfiletype javascript
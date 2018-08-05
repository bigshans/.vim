filetype plugin indent on 
" -----------------------*-----------------------------" 
call plug#begin('~/.vim/bundle')

Plug 'git://github.com/scrooloose/nerdtree.git'
Plug 'git://github.com/flazz/vim-colorschemes.git'
" Plug 'git://github.com/Valloric/YouCompleteMe.git'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'lilydjwg/fcitx.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
" Plug 'Yggdroot/LeaderF'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'mattn/emmet-vim'
Plug 'sillybun/vim-repl'
Plug 'git://github.com/tpope/vim-ragtag.git'
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/gko/vim-coloresque.git'
Plug 'marijnh/tern_for_vim'
Plug 'lfv89/vim-interestingwords'
Plug '~/.vim/bundle/project'
Plug 'maksimr/vim-jsbeautify'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'majutsushi/tagbar'
Plug 'brooth/far.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'thinca/vim-quickrun'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'
Plug 'godlygeek/tabular' "必须在markdown插件之前
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown' "实时预览markdown插件
Plug 'https://github.com/mbbill/undotree.git'
Plug 'biskark/vim-ultimate-colorscheme-utility'
Plug 'mikelue/vim-maven-plugin'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'terryma/vim-smooth-scroll'
Plug 'terryma/vim-expand-region'
Plug 'danro/rename.vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
Plug 'hail2u/vim-css3-syntax'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'carlitux/deoplete-ternjs', {'do':'npm install -g tern'}
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
" Plug 'zchee/deoplete-zsh'
" Plug 'pocke/vueim'
" Plug 'Shougo/denite.nvim'
" Plug 'scrooloose/nerdtree-project-plugin'
" Plug 't9md/vim-choosewin'
" Plug 'tenfyzhong/CompleteParameter.vim'
" Plug 'vimwiki/vimwiki' 

call plug#end()

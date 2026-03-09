call packs#begin($HOME_VIM . '/bundle')

" ===============
" LSP
" ===============
call packs#def('neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }, 'coc')

" ===============
" Search Tools
" ===============
call packs#def('Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }, 'leaderf')
call packs#def('junegunn/fzf.vim', 'fzf')
call packs#def('mileszs/ack.vim')
call packs#def('vim-scripts/utl.vim')
call packs#def('dyng/ctrlsf.vim', 'ctrlsf')

" ===============
" Behaviour
" ===============
call packs#def('lambdalisue/suda.vim')
call packs#def('romainl/vim-cool')
call packs#def('drmikehenry/vim-fixkey')
call packs#def('rhysd/clever-f.vim', 'clever-f')
if !(has('win32') || has('win64'))
    call packs#def('bigshans/fcitx.vim', 'fcitx')
endif
call packs#def('easymotion/vim-easymotion', 'easymotion')
call packs#def('szw/vim-maximizer')
call packs#def('habamax/vim-winlayout', 'vim-winlayout')
call packs#def('andymass/vim-matchup', 'vim-matchup')

" ===============
" Floaterm
" ==============

call packs#def('voldikss/LeaderF-floaterm', 'leaderF-Floaterm')
call packs#def('voldikss/vim-floaterm', 'vim-floaterm')

" ===============
" Appearance
" ===============
call packs#def('lambdalisue/vim-nerdfont')
call packs#def('sainnhe/artify.vim')
call packs#def('vim-airline/vim-airline', 'airline')
call packs#def('vim-airline/vim-airline-themes')

" ===============
" Theme 
" ===============
call packs#def('catppuccin/vim', { 'as': 'catppuccin' })
call packs#def('sainnhe/sonokai', 'sonokai')
call packs#def('dracula/vim', { 'as': 'dracula' })
call packs#def('joshdick/onedark.vim')

" ===============
" File Manager
" ===============
call packs#def('habamax/vim-dir', 'vim-dir')

" ===============
" Which key
" ===============
call packs#def('skywind3000/vim-quickui', 'quickui')
call packs#def('skywind3000/vim-navigator', 'vim-navigator')

" ===============
" FileType
" ===============
call packs#def('godlygeek/tabular', { 'for': 'markdown' })
call packs#def('preservim/vim-markdown', { 'for': 'markdown' }, 'markdown')
call packs#def('chemzqm/wxapp.vim')
call packs#def('leafOfTree/vim-vue-plugin', { 'for': 'vue' })

" ===============
" Edit
" ===============
call packs#def('tpope/vim-repeat')
call packs#def('mg979/vim-visual-multi', { 'branch': 'master' }, 'vim-visual-multi')
call packs#def('vim-autoformat/vim-autoformat', 'autoformat')
call packs#def('machakann/vim-sandwich', 'sandwich')
call packs#def('alvan/vim-closetag', 'closetag')
call packs#def('preservim/nerdcommenter', 'nerdcommenter')
call packs#def('preservim/vim-pencil', { 'on': 'Pencil' })
call packs#def('jiangmiao/auto-pairs')

" ===============
" Project
" ===============

" vim-session required
call packs#def('xolox/vim-misc')
call packs#def('xolox/vim-session', 'vim-session')
call packs#def('skywind3000/asyncrun.vim', 'asyncrun')

" ===============
" Git
" ===============

call packs#def("tpope/vim-fugitive", "git")

" ===============
" Stuff
" ===============

if has('win32') || has("win64")
    call packs#def('wakatime/vim-wakatime')
endif

call packs#end()

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
call packs#def('easymotion/vim-easymotion', {'on': '<Plug>(easymotion-overwin-f)'}, 'easymotion')
" call packs#def('habamax/vim-winlayout', 'vim-winlayout')
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
call packs#def('vim-airline/vim-airline', 'airline')
call packs#def('vim-airline/vim-airline-themes')
call packs#def('junegunn/goyo.vim', {'on': 'Goyo'}, 'goyo')

" ===============
" Theme 
" ===============
call packs#def('sainnhe/sonokai', 'sonokai')

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
call packs#def('vim-autoformat/vim-autoformat', {'on': 'Autoformat'}, 'autoformat')
call packs#def('machakann/vim-sandwich', 'sandwich')
call packs#def('alvan/vim-closetag', 'closetag')
" call packs#def('preservim/nerdcommenter', 'nerdcommenter')
call packs#def('tomtom/tcomment_vim', 'tcomment')
call packs#def('preservim/vim-pencil', { 'on': 'Pencil' })
call packs#def('jiangmiao/auto-pairs')

" ===============
" Project
" ===============

" session / project
call packs#def('xolox/vim-misc')
call packs#def('xolox/vim-session', 'vim-session')
call packs#def('leafOfTree/vim-project', 'vim-project')
call packs#def('skywind3000/asyncrun.vim', 'asyncrun')
call packs#def('skywind3000/asynctasks.vim', 'asynctasks')

" ===============
" Git
" ===============

call packs#def("tpope/vim-fugitive", "git")

" ===============
" Stuff
" ===============

call packs#def("fresh2dev/zellij.vim")

if has('win32') || has("win64")
    call packs#def('wakatime/vim-wakatime', 'wakatime')
endif

call packs#end()

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

" ===============
" Floaterm
" ==============

call packs#def('voldikss/vim-floaterm')

" ===============
" Appearance
" ===============
call packs#def('ryanoasis/vim-devicons')
call packs#def('sainnhe/artify.vim')
call packs#def('vim-airline/vim-airline', 'airline')
call packs#def('vim-airline/vim-airline-themes')
call packs#def('catppuccin/vim', { 'as': 'catppuccin' }, 'catppuccin')

" ===============
" Which key
" ===============
call packs#def('skywind3000/vim-quickui')
call packs#def('skywind3000/vim-navigator', 'vim-navigator')

" ===============
" FileType
" ===============
call packs#def('godlygeek/tabular', { 'for': 'markdown' })
call packs#def('preservim/vim-markdown', { 'for': 'markdown' }, 'markdown')
call packs#def('chemzqm/wxapp.vim')

" ===============
" Edit
" ===============
call packs#def('tpope/vim-repeat')
call packs#def('mg979/vim-visual-multi', { 'branch': 'master' }, 'vim-visual-multi')
call packs#add('comment', 'comment')
call packs#def('vim-autoformat/vim-autoformat', 'autoformat')
call packs#def('machakann/vim-sandwich', 'sandwich')
call packs#def('alvan/vim-closetag', 'closetag')

" ===============
" Project
" ===============
call packs#def('leafOfTree/vim-project', 'vim-project')

" ===============
" Git
" ===============

call packs#def("tpope/vim-fugitive", "git")

call packs#end()

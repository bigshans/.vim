" vim-project: 按项目隔离 cwd、搜索、任务、git 和配置
" 必须在插件加载前设置 g:vim_project_config
let g:vim_project_config = {
      \ 'use_session': 1,
      \ 'use_viminfo': 0,
      \ 'exclude': ['.git', 'node_modules', 'dist', 'build', 'target', '.venv'],
      \ }

nnoremap <silent> <leader>pp :ProjectList<CR>
nnoremap <silent> <leader>pf :ProjectSearchFiles<CR>
nnoremap <silent> <leader>pg :ProjectFindInFiles<CR>
nnoremap <silent> <leader>pr :ProjectRun<CR>
nnoremap <silent> <leader>pG :ProjectGitStatus<CR>
nnoremap <silent> <leader>pi :ProjectInfo<CR>

" <leader>sp 保留给 vim-session 的 OpenSession，避免启用本插件后抢键

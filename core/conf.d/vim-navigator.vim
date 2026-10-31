scriptencoding utf-8

" vim-navigator：which-key 风格的分组菜单
" 用 <tab><tab> 或 <leader>? 打开；打开后按与 <leader> 相同的后续键即可定位，
" 例如 <tab><tab>pp = <leader>pp、<tab><tab>sr = <leader>sr。
let g:navigator = {
            \ 'q': ['utils#quit()', '关闭当前缓冲区'],
            \ 'Q': [':qa!', '退出全部'],
            \ 'f': {'name': '文件'},
            \ 'j': {'name': 'LSP / coc'},
            \ 'b': {'name': '缓冲区 / 标签'},
            \ 'o': {'name': '打开'},
            \ 'P': {'name': '插件'},
            \ 'p': {'name': '项目 / 会话'},
            \ 'w': {'name': '窗口'},
            \ 's': {'name': '搜索'},
            \ 'g': {'name': 'Git'},
            \ 'e': {'name': '跳转'},
            \ 'c': {'name': '注释'},
            \ 'a': {'name': '异步任务'},
            \ 't': {'name': '终端'},
            \ }

let g:navigator.prefix = '<tab><tab>'

function! DeepMerge(dest, src) abort
    for [key, val] in items(a:src)
        " 两边都是字典时递归合并，否则直接覆盖/新增
        if has_key(a:dest, key)
                    \ && type(a:dest[key]) == v:t_dict
                    \ && type(val) == v:t_dict
            call DeepMerge(a:dest[key], val)
        else
            let a:dest[key] = val
        endif
    endfor
    return a:dest
endfunction

function! ExtendNavigator(tag, src) abort
    let l:tags = type(a:tag) == v:t_list ? a:tag : [a:tag]
    for l:item in l:tags
        if l:item ==# 'builtin' || index(g:packs_config_list, l:item) >= 0
            call DeepMerge(g:navigator, a:src)
            return
        endif
    endfor
endfunction

nnoremap <silent> <tab><tab> :Navigator g:navigator<CR>
" 更顺手的入口，和 <tab><tab> 等价
nnoremap <silent> <leader>? :Navigator g:navigator<CR>

" =============================================================================
" 内置操作
" =============================================================================
call ExtendNavigator('builtin', {
            \ 'f': {
                \ 's': [':w', '保存'],
                \ 'S': ['utils#sudo_save()', '以 root 保存'],
            \ },
            \ 'b': {
                \ 'N': [':bnext', '下一个缓冲区'],
                \ 'P': [':bprevious', '上一个缓冲区'],
                \ 'd': [':bdelete', '关闭当前缓冲区'],
                \ 'f': [':bfirst', '第一个缓冲区'],
                \ 'e': [':blast', '最后一个缓冲区'],
            \ },
            \ 'w': {
                \ '0': [':0wincmd w', '跳到窗口 0'],
                \ '1': [':1wincmd w', '跳到窗口 1'],
                \ '2': [':2wincmd w', '跳到窗口 2'],
                \ '3': [':3wincmd w', '跳到窗口 3'],
                \ '4': [':4wincmd w', '跳到窗口 4'],
                \ '5': [':5wincmd w', '跳到窗口 5'],
                \ '6': [':6wincmd w', '跳到窗口 6'],
                \ '7': [':7wincmd w', '跳到窗口 7'],
                \ '8': [':8wincmd w', '跳到窗口 8'],
                \ '9': [':9wincmd w', '跳到窗口 9'],
                \ 'c': [':close', '关闭当前窗口'],
                \ 's': [':split', '水平分屏'],
                \ 'v': [':vsplit', '垂直分屏'],
            \ },
            \ 'o': {
                \ 'p': [printf(':e %s', fnameescape(utils#stdpath($CORE_CONFIG . '/plugins.vim'))), '插件清单'],
            \ },
            \ })

" =============================================================================
" LSP / coc
" =============================================================================
call ExtendNavigator('coc', {
            \ 'f': {
                \ 't': [':CocCommand explorer --toggle --sources=buffer-,file+ --preset', '文件树'],
            \ },
            \ 'y': [':CocList -A --normal yank', '剪贴板历史'],
            \ 'j': {
                \ 'a': ['<plug>(coc-codeaction)', '代码操作'],
                \ 'c': ['<plug>(coc-diagnostic-info)', '当前行诊断'],
                \ 'd': [':CocList diagnostics', '诊断列表'],
                \ 'e': ['<plug>(coc-codeaction-refactor)', '重构'],
                \ 'f': ['<plug>(coc-fix-current)', '修复当前错误'],
                \ 'F': ["call CocActionAsync('fixAll')", '修复全部'],
                \ 'l': ['<plug>(coc-codelens-action)', '运行 codelens'],
                \ 'r': ['<plug>(coc-rename)', '重命名'],
                \ 'o': [':call ToggleOutline()', '切换大纲'],
                \ 'k': [':call ShowDocumentation()', '查看文档'],
                \ 'D': ["<KEY>:let b:coc_suggest_disable = !get(b:, 'coc_suggest_disable', 0)<CR>", '切换当前缓冲区补全'],
                \ '=': [':Format', '格式化'],
            \ },
            \ 'o': {
                \ 'C': [':CocConfig', 'coc 设置'],
            \ },
            \ })

" =============================================================================
" 缓冲区 / 标签（airline）
" =============================================================================
call ExtendNavigator('airline', {
            \ 'b': {
                \ '0': ['<plug>AirlineSelectTab0', '标签 0'],
                \ '1': ['<plug>AirlineSelectTab1', '标签 1'],
                \ '2': ['<plug>AirlineSelectTab2', '标签 2'],
                \ '3': ['<plug>AirlineSelectTab3', '标签 3'],
                \ '4': ['<plug>AirlineSelectTab4', '标签 4'],
                \ '5': ['<plug>AirlineSelectTab5', '标签 5'],
                \ '6': ['<plug>AirlineSelectTab6', '标签 6'],
                \ '7': ['<plug>AirlineSelectTab7', '标签 7'],
                \ '8': ['<plug>AirlineSelectTab8', '标签 8'],
                \ '9': ['<plug>AirlineSelectTab9', '标签 9'],
                \ 'p': ['<plug>AirlineSelectPrevTab', '上一个标签'],
                \ 'n': ['<plug>AirlineSelectNextTab', '下一个标签'],
            \ },
            \ })

" =============================================================================
" 插件管理（vim-plug）
" =============================================================================
call ExtendNavigator('vim-plug', {
            \ 'P': {
                \ 'i': [':PlugInstall', '安装插件'],
                \ 'u': [':PlugUpdate', '更新插件'],
                \ 'g': [':PlugUpgrade', '升级 vim-plug'],
            \ },
            \ })

" =============================================================================
" 搜索（LeaderF）
" =============================================================================
call ExtendNavigator('leaderf', {
            \ 'f': {
                \ 'f': [':LeaderfFile', '查找文件'],
            \ },
            \ 'b': {
                \ 'l': [':Leaderf buffer', '缓冲区列表'],
            \ },
            \ 's': {
                \ 'b': [':Leaderf buffer', '缓冲区列表'],
                \ 'd': [':LeaderfFile', '查找文件'],
                \ 'h': [':Leaderf help', '帮助文档'],
                \ 'l': [':Leaderf line', '当前缓冲区行'],
                \ 'r': [':Leaderf rg', '全项目搜索'],
                \ 's': [':Leaderf line --all', '所有缓冲区行'],
            \ },
            \ 'o': {
                \ 'c': [printf(':Leaderf file %s', $HOME_VIM), 'Vim 配置'],
            \ },
            \ })

call ExtendNavigator(['asynctasks', 'leaderf', 'floaterm'], {
            \ 's': {
                \ 't': [':Leaderf --nowrap task', '任务列表'],
            \ },
            \ })

" =============================================================================
" Git（fugitive）
" =============================================================================
call ExtendNavigator('git', {
            \ 'g': {
                \ 'a': [':Git add .', '暂存全部'],
                \ 'b': [':Git blame', '查看 blame'],
                \ 'c': [':Git commit', '提交'],
                \ 'd': [':Gvdiffsplit', '查看 diff'],
                \ 'r': [':Gread', '恢复文件内容'],
                \ 'g': [':Git', 'Git 状态'],
                \ 'p': {
                    \ 'name': '推送 / 拉取',
                    \ 's': [':Git! push', '推送'],
                    \ 'l': [':Git! pull', '拉取'],
                \ },
                \ 'w': [':Gwrite', '写入暂存'],
            \ },
            \ })

" =============================================================================
" 跳转（easymotion）
" =============================================================================
call ExtendNavigator('easymotion', {
            \ 'e': {
                \ 'f': ['<Plug>(easymotion-overwin-f)', '单字符跳转'],
                \ 'F': ['<Plug>(easymotion-overwin-f2)', '双字符跳转'],
            \ },
            \ })

" =============================================================================
" 注释（tcomment；comment / nerdcommenter 为休眠配置）
" =============================================================================
call ExtendNavigator('tcomment', {
            \ 'c': {
                \ 'i': ['<plug>TComment_gcc', '切换当前行注释'],
            \ },
            \ })

call ExtendNavigator('comment', {
            \ 'c': {
                \ 'i': ['<plug>(comment-toggle-line)', '切换当前行注释'],
            \ },
            \ })

call ExtendNavigator('nerdcommenter', {
            \ 'c': {
                \ 'c': ['<plug>(NERDCommenterComment)', '添加注释'],
                \ 'i': ['<plug>(NERDCommenterInvert)', '切换注释'],
                \ 's': ['<plug>(NERDCommenterSexy)', '美观的多行注释'],
            \ },
            \ })

" =============================================================================
" 项目 / 会话
" =============================================================================
call ExtendNavigator('vim-project', {
            \ 'p': {
                \ 'p': [':ProjectList', '项目列表'],
                \ 'f': [':ProjectSearchFiles', '项目内查找文件'],
                \ 'g': [':ProjectFindInFiles', '项目内全文搜索'],
                \ 'r': [':ProjectRun', '运行项目任务'],
                \ 'G': [':ProjectGitStatus', '项目 Git 状态'],
                \ 'i': [':ProjectInfo', '项目信息'],
            \ },
            \ })

call ExtendNavigator('vim-session', {
            \ 'p': {
                \ 'a': [':AddCurrentProject', '添加当前目录为项目'],
                \ 's': ['<KEY>:SaveSession', '保存会话'],
                \ 'o': [':OpenSession', '打开会话'],
                \ 'd': [':DeleteSession', '删除会话'],
                \ 'c': [':CloseSession', '关闭会话'],
            \ },
            \ 's': {
                \ 'p': [':OpenSession', '打开会话（同 po）'],
            \ },
            \ })

" =============================================================================
" 异步任务
" =============================================================================
call ExtendNavigator('asyncrun', {
            \ 'a': {
                \ 'r': ['RunCmdAsync()', '运行异步命令'],
                \ 'd': [':AsyncStop', '停止异步任务'],
            \ },
            \ })

call ExtendNavigator(['asyncrun', 'floaterm'], {
            \ 'a': {
                \ 'f': [':AsyncTask float-shell', '在 floaterm 运行任务'],
            \ },
            \ })

" =============================================================================
" 窗口布局（vim-winlayout，默认休眠）
" =============================================================================
call ExtendNavigator('vim-winlayout', {
            \ 'w': {
                \ 'b': ['<Plug>(WinlayoutBackward)', '上一个窗口布局'],
                \ 'p': ['<Plug>(WinlayoutForward)', '下一个窗口布局'],
            \ },
            \ })

" =============================================================================
" 终端
" =============================================================================
call ExtendNavigator(['leaderF-Floaterm', 'leaderf'], {
            \ 't': {
                \ 'f': [':Leaderf floaterm', '查找 floaterm'],
            \ },
            \ })

call ExtendNavigator('vim-floaterm', {
            \ 't': {
                \ 't': [':FloatermToggle', '切换 floaterm'],
                \ 'n': [':FloatermNew', '新建 floaterm'],
                \ 'k': ['FloatermKillCmd()', '关闭 floaterm'],
            \ },
            \ })

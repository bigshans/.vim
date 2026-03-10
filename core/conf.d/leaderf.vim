" let g:Lf_WindowPosition = 'popup'
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFot = "DroidSansM Nerd Font Mono"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupPreviewPosition = 'top'

let g:Lf_ShortcutF = '<leader>ff'
let g:Lf_ShortcutB = '<leader>sb'
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_UseCache = 0

nnoremap <silent><plug>LeaderfCurFolderFile :<C-U><C-R>=printf("Leaderf file %s", expand('%:p:h'))<CR><CR>

nnoremap <leader>sr :Leaderf rg<CR>
nnoremap <leader>sl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>ss :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>sh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>
nnoremap <leader>sd :LeaderfFile<CR>
nnoremap <leader>sp :ProjectList<CR>

exec printf("nnoremap <leader>oc :Leaderf file %s<CR>", fnameescape($HOME_VIM))

if index(g:packs_config_list, 'asynctasks') >= 0
    function! s:lf_task_source(...)
        let rows = asynctasks#source(&columns * 48 / 100)
        let source = []
        for row in rows
            let name = row[0]
            let source += [name . '  ' . row[1] . '  : ' . row[2]]
        endfor
        return source
    endfunction


    function! s:lf_task_accept(line, arg)
        let pos = stridx(a:line, '<')
        if pos < 0
            return
        endif
        let name = strpart(a:line, 0, pos)
        let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
        if name != ''
            exec "AsyncTask " . name
        endif
    endfunction

    function! s:lf_task_digest(line, mode)
        let pos = stridx(a:line, '<')
        if pos < 0
            return [a:line, 0]
        endif
        let name = strpart(a:line, 0, pos)
        return [name, 0]
    endfunction

    function! s:lf_win_init(...)
        setlocal nonumber
        setlocal nowrap
    endfunction


    let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
    let g:Lf_Extensions.task = {
                \ 'source': string(function('s:lf_task_source'))[10:-3],
                \ 'accept': string(function('s:lf_task_accept'))[10:-3],
                \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
                \ 'highlights_def': {
                \     'Lf_hl_funcScope': '^\S\+',
                \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
                \ },
                \ 'help' : 'navigate available tasks from asynctasks.vim',
                \ }
    noremap <leader>st :Leaderf --nowrap task<CR>
endif

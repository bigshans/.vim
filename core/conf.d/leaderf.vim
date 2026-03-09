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

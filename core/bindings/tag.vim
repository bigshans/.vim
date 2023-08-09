call DetectKeyMapRegister(g:navigator, "<leader>")

let g:navigator["<leader>"].t = {
            \ "name": "gtags...",
            \ "r" :['<key><C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>', 'references'],
            \ "d" :['<key><C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>', 'define'],
            \ "o" :['<key><C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>', 'call'],
            \ "n" :['<key><C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>', 'next'],
            \ "p" :['<key><C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>', 'previous'],
            \ "u" :['<key><C-U><C-R>=printf("Leaderf gtags --update")<CR><CR>', 'update'],
            \ "t" :['<key><C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>', 'buffer tag'],
            \ }

noremap <leader>tr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>td :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>to :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>tn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>tp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>tu :<C-U><C-R>=printf("Leaderf gtags --update")<CR><CR>
noremap <leader>tt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>

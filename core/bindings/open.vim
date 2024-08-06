let s:core_folder = fnameescape(g:vim_config_home."/core")
let s:plugin_file = fnameescape(s:core_folder."/plugin.vim")

let g:navigator["<leader>"].o = {
            \ 'name': "open the file...",
            \ 'p': [":e ".s:plugin_file, "open plugin.vim"],
            \ 'C': [":CocConfig", "open coc-setting.json"],
            \ 'c': [":Leaderf file ".s:core_folder, "open core dir"]
            \ }

nnoremap <leader>oC :CocConfig<CR>
exec 'nnoremap <leader>op :e '.s:plugin_file.'<CR>'
exec 'nnoremap <leader>oc :Leaderf file '.s:core_folder.'<CR>'

let s:core_folder = fnameescape(g:vim_config_home."/core")
let s:plugin_file = fnameescape(s:core_folder."/plugin.vim")

let g:navigator["<leader>"].o = {
            \ 'name': "open the file...",
            \ 'p': [":e ".s:plugin_file, "open plugin.vim"],
            \ 'C': [":CocConfig", "open coc-setting.json"],
            \ 'c': [":Leaderf file ".s:core_folder, "open core dir"],
            \ 'v': [":Leaderf file ".g:vim_config_home, "open vim dir"],
            \ 's': [":OpenSession", "open session"],
            \ }

nnoremap <leader>oC :CocConfig<CR>
nnoremap <leader>os :OpenSession<CR>
exec 'nnoremap <leader>op :e '.s:plugin_file.'<CR>'
exec 'nnoremap <leader>oc :Leaderf file '.s:core_folder.'<CR>'
exec 'nnoremap <leader>ov :Leaderf file '.g:vim_config_home.'<CR>'

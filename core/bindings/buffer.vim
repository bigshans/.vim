call DetectKeyMapRegister(g:navigator, "<leader>")

if exists('g:lightline')
    let g:navigator["<leader>"].b = {
                \ 'name': 'buffers...',
                \ 'n': ["<plug>lightline#bufferline#go_next()", "next buffer"],
                \ 'p': ["<plug>lightline#bufferline#go_previous()", "previous buffer"],
                \ 'd': [":bdelete", "delete current buffer"],
                \ }

    nmap <leader>bn <Plug>lightline#bufferline#go_next()
    nmap <leader>bp <Plug>lightline#bufferline#go_previous()
    nmap <M-1> <Plug>lightline#bufferline#go(1)
    nmap <M-2> <Plug>lightline#bufferline#go(2)
    nmap <M-3> <Plug>lightline#bufferline#go(3)
    nmap <M-4> <Plug>lightline#bufferline#go(4)
    nmap <M-5> <Plug>lightline#bufferline#go(5)
    nmap <M-6> <Plug>lightline#bufferline#go(6)
    nmap <M-7> <Plug>lightline#bufferline#go(7)
    nmap <M-8> <Plug>lightline#bufferline#go(8)
    nmap <M-9> <Plug>lightline#bufferline#go(9)
    nmap <M-0> <Plug>lightline#bufferline#go(10)
else
    let g:navigator["<leader>"].b = {
                \ 'name': 'buffers...',
                \ 'n': ["<plug>AirlineSelectNextTab", "next buffer"],
                \ 'p': ["<plug>AirlineSelectPrevTab", "previous buffer"],
                \ 'd': [":bdelete", "delete current buffer"],
                \ }

    nmap <leader>bn <Plug>AirlineSelectPrevTab
    nmap <leader>bp <Plug>AirlineSelectNextTab
    nmap <leader>bd :bdelete<CR>
    nmap <M-1> <Plug>AirlineSelectTab1
    nmap <M-2> <Plug>AirlineSelectTab2
    nmap <M-3> <Plug>AirlineSelectTab3
    nmap <M-4> <Plug>AirlineSelectTab4
    nmap <M-5> <Plug>AirlineSelectTab5
    nmap <M-6> <Plug>AirlineSelectTab6
    nmap <M-7> <Plug>AirlineSelectTab7
    nmap <M-8> <Plug>AirlineSelectTab8
    nmap <M-9> <Plug>AirlineSelectTab9
    nmap <M-0> <Plug>AirlineSelectTab0
endif


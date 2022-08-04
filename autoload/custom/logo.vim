" Rand function procvide by 
" https://stackoverflow.com/questions/12737977/native-vim-random-number-script/
function Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

function custom#logo#get()
    return g:aerian_s_vim_logo[Rand()%len(g:aerian_s_vim_logo)]
endfunction
" ASCII Art created by 
" http://patorjk.com/software/taag/#p=testall&h=3&v=2&f=Doh&t=Aerian's%20Vim
let g:aerian_s_vim_logo = [
            \ [
                \"",
                \"",
                \"",
                \"",
                \" ▄▄▄      ▓█████  ██▀███   ██▓ ▄▄▄       ███▄    █   ██████     ███▄    █  ██▒   █▓ ██▓ ███▄ ▄███▓",
                \"▒████▄    ▓█   ▀ ▓██ ▒ ██▒▓██▒▒████▄     ██ ▀█   █ ▒██    ▒     ██ ▀█   █ ▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
                \"▒██  ▀█▄  ▒███   ▓██ ░▄█ ▒▒██▒▒██  ▀█▄  ▓██  ▀█ ██▒░ ▓██▄      ▓██  ▀█ ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
                \"░██▄▄▄▄██ ▒▓█  ▄ ▒██▀▀█▄  ░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒  ▒   ██▒   ▓██▒  ▐▌██▒  ▒██ █░░░██░▒██    ▒██ ",
                \" ▓█   ▓██▒░▒████▒░██▓ ▒██▒░██░ ▓█   ▓██▒▒██░   ▓██░▒██████▒▒   ▒██░   ▓██░   ▒▀█░  ░██░▒██▒   ░██▒",
                \" ▒▒   ▓▒█░░░ ▒░ ░░ ▒▓ ░▒▓░░▓   ▒▒   ▓▒█░░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░   ░ ▒░   ▒ ▒    ░ ▐░  ░▓  ░ ▒░   ░  ░",
                \"  ▒   ▒▒ ░ ░ ░  ░  ░▒ ░ ▒░ ▒ ░  ▒   ▒▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░   ░ ░░   ░ ▒░   ░ ░░   ▒ ░░  ░      ░",
                \"  ░   ▒      ░     ░░   ░  ▒ ░  ░   ▒      ░   ░ ░ ░  ░  ░        ░   ░ ░      ░░   ▒ ░░      ░   ",
                \"      ░  ░   ░  ░   ░      ░        ░  ░         ░       ░              ░       ░   ░         ░   ",
                \"                                                                               ░                  ",
                \"",
                \"",
                \"",
            \ ],
            \ [
                \"",
                \"",
                \"",
                \"",
                \"",
                \" █████╗ ███████╗██████╗ ██╗ █████╗ ███╗   ██╗███████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                \"██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗  ██║██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║",
                \"███████║█████╗  ██████╔╝██║███████║██╔██╗ ██║███████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║",
                \"██╔══██║██╔══╝  ██╔══██╗██║██╔══██║██║╚██╗██║╚════██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                \"██║  ██║███████╗██║  ██║██║██║  ██║██║ ╚████║███████║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                \"╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                \"                                                                                          ",
                \"",
                \"",
                \"",
            \ ],
            \ [
            \"",
            \"",
            \"",
            \"",
            \ '                                        ▟▙            ',
            \ '                                        ▝▘            ',
            \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
            \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
            \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
            \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
            \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
            \ '',
            \ '',
            \ '',
            \ ],
            \ ]

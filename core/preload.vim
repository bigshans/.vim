command! C :call utils#mk_dir()
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! W :call utils#sudo_save()

command! -nargs=+ -bar PL call plugin#append(<args>)
command! -nargs=+ -bar PLL call plugin#append_lua(<args>)

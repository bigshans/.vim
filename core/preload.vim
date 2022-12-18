command! C :call utils#mk_dir()
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! W :call utils#sudo_save()

command! -nargs=+ -bar P call p#append(<args>)
command! -nargs=+ -bar PL call p#append_lua(<args>)

" =============================================================================
" 自定义命令
" =============================================================================
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! Bonly execute '%bd|e#|bd#'
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()
command! -nargs=1 -complete=color SetTheme call SetTheme(<q-args>)
command! -nargs=0 PacksDormant echo 'Dormant configs: ' . join(packs#dormant(), ', ')

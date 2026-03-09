" =============================================================================
" 自定义命令
" =============================================================================
command! Hex :%!xxd
command! HexExit :%!xxd -r
command! Bonly execute '%bd|e#|bd#'
command! Bigger :call utils#bigger()
command! Smaller :call utils#smaller()

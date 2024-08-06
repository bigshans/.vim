let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#show_number = 2

function LightlineBufferlineFilter(buffer)
  return getbufvar(a:buffer, '&buftype') !=# 'terminal'
endfunction

let g:lightline#bufferline#buffer_filter = "LightlineBufferlineFilter"

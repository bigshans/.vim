let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under']                  = '<C-n>'
let g:VM_maps['Find Subword Under']          = '<C-n>'

nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)  
nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

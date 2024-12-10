let g:navigator["<C-w>"] = {
            \ "name": "windows",
            \ "h": ["<KEY><C-w><C-h>", "to left win"],
            \ "j": ["<KEY><C-w><C-j>", "to down win"],
            \ "k": ["<KEY><C-w><C-k>", "to up win"],
            \ "l": ["<KEY><C-w><C-l>", "to right win"],
            \ "0": [":only", "delete other win"],
            \ "c": [":ChooseWin", "goto"],
            \ "q": [":close", "close win"],
            \ "<C-s>": [":ChooseWinSwap", "swap win"]
            \ }

let g:navigator["<leader>"].w = {
            \ "name": "windows",
            \ "j": {
                \ "name": "jump",
                \ "h": ["<KEY><C-w><C-h>", "to left win"],
                \ "j": ["<KEY><C-w><C-j>", "to down win"],
                \ "k": ["<KEY><C-w><C-k>", "to up win"],
                \ "l": ["<KEY><C-w><C-l>", "to right win"],
            \},
            \ "h": [":split", "split window"],
            \ "v": [":vsplit", "split window vertical"],
            \ "0": [":only", "delete other win"],
            \ "g": [":ChooseWin", "goto"],
            \ "c": [":close", "close win"],
            \ "s": [":ChooseWinSwap", "swap win"]
            \ }

nnoremap <C-w>c :ChooseWin<CR>
nnoremap <C-w><C-s> :ChooseWinSwap<CR>
nnoremap <C-w>q :close<CR>
nnoremap <C-w>0 :only<CR>

nnoremap <leader>wg :ChooseWin<CR>
nnoremap <leader>ws :ChooseWinSwap<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>w0 :only<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wjh <C-w><C-h>
nnoremap <leader>wjj <C-w><C-j>
nnoremap <leader>wjk <C-w><C-k>
nnoremap <leader>wjl <C-w><C-l>

for i in range(1, 9)
    let winn = i
    execute 'nnoremap <leader>w' . i . ' :' . winn . 'wincmd w<CR>'
    let g:navigator["<leader>"].w[i] = [":" . winn . "wincmd w", "jump to win " . winn]
endfor

nnoremap <leader>w0 :10wincmd w<CR>
let g:navigator["<leader>"].w[0] = [":10wincmd w", "jump to win 10"]

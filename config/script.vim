let mapleader="\<Space>"
set nocompatible
set mouse=a
" set so=999
filetype off
"-----------------------*-----------------------------"
"colorscheme ui config
set cursorline "当前行高亮
set t_Co=256
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" colorscheme nord
" let g:nord_italic=1
" let g:nord_italic_comments=1
" let g:nord_comment_brightness=12
" let g:nord_uniform_status_lines=1
" colorscheme one
set background=dark
" set background=light
" colorscheme monokai-chris
"colorscheme Tomorrow-Night
" colorscheme solarized
colorscheme gruvbox
set nu
set hlsearch
set title
syntax enable
syntax on
set guifont=NotoMonoforPowerline\ 11
"允许换行
set whichwrap+=<,>,h,l
set magic
"-----------------------*-----------------------------"
"edit config
set encoding=utf-8
set laststatus=2
set complete-=k complete+=k
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set smartindent
set autoindent
set list
set listchars=eol:↩︎
"status config
set laststatus=2
set writebackup
set nobackup
"-----------------------*-----------------------------"
"my personal script for my keybind
let g:screen_center_toggle_flag = 1
function! ScreenCenterToggle()
    if g:screen_center_toggle_flag == 0
        exec 'nnoremap j j'
        exec 'nnoremap k k'
        echo  '已经关闭，j和k恢复默认键位'
        let g:screen_center_toggle_flag = 1
    else
        exe 'norm! zz'
        exec 'nnoremap j jzz'
        exec 'nnoremap k kzz'
        echo  '已经启用，光标将保持在屏幕中间'
        let g:screen_center_toggle_flag = 0
    endif
endfunction


function! MoveLineCodeUp()
    let l:pos = getpos('.')
    let l:cursor = l:pos[1]
    if l:cursor != 1
        exec l:cursor . ' move -2'
        exe 'norm! v='
    endif
endfunction

function! MoveLineCodeDown()
    let l:pos = getpos('.')
    let l:cursor = l:pos[1]
    let l:end_row = line('$')
    if l:cursor != l:end_row
        exec l:cursor . ' move +1'
        exe 'norm! v='
    endif
endfunction

function! MoveCodeByVisualAeraDefined()
    if exists('b:move_code_start') == 0
        let b:move_code_start = line('v')
    endif
    if exists('g:move_code_end') == 0
        let b:move_code_end = line('.')
    endif
    if exists('b:code_can_move') == 0
        let b:code_can_move = 0
    endif
endfunction

function! MoveCodeByVisualAeraUnlet()
    if exists('b:move_code_start') == 1
        unlet b:move_code_start
    endif
    if exists('b:move_code_end') == 1
        unlet b:move_code_end
    endif
    if exists('b:code_can_move') == 1
        unlet b:code_can_move
    endif
    if exists('b:one_line') == 1
        unlet b:one_line
    endif
endfunction

function! MoveCodeUp()
    call MoveCodeByVisualAeraDefined()
    let b:code_can_move = 1
endfunction

function! MoveCodeDown()
    call MoveCodeByVisualAeraDefined()
    let b:code_can_move = 2
endfunction

function! MoveReselected()
    let l:low_pos = (b:move_code_start > b:move_code_end)?b:move_code_start:b:move_code_end
    let l:hight_pos = (b:move_code_start < b:move_code_end)?b:move_code_start:b:move_code_end
    if b:code_can_move == 1
        " echom l:hight_pos
        if l:hight_pos > 1
            let l:hight_pos -= 1
            exec l:hight_pos . ' move ' . l:low_pos
            " let l:hight_pos -= 1
            " exe 'norm! ' . l:hight_pos . 'G'
            " while l:hight_pos < l:low_pos
                " call MoveLineCodeDown()
                " let l:hight_pos += 1
            " endwhile
            let b:move_code_start -= 1
            let b:move_code_end -= 1
        endif
    elseif b:code_can_move == 2
        let l:row_b = line('$')
        if l:low_pos < l:row_b
            let l:low_pos += 1
            exe 'norm! ' . l:low_pos . 'G'
            while l:low_pos > l:hight_pos
                call MoveLineCodeUp()
                let l:low_pos -= 1
            endwhile
            let b:move_code_start += 1
            let b:move_code_end += 1
        endif
    endif
    exec 'norm! '. b:move_code_start . 'GV' . b:move_code_end . 'G'
    call MoveCodeByVisualAeraUnlet()
endfunction

"-----------------------*-----------------------------"
" not used
"complier config
" func! CompileGcc()
    " exec "w"
    " let compilecmd="!gcc "
    " let compileflag="-o %< "
    " if search("mpi\.h") != 0
        " let compilecmd = "!mpicc "
    " endif
    " if search("glut\.h") != 0
        " let compileflag .= " -lglut -lGLU -lGL "
    " endif
    " if search("cv\.h") != 0
        " let compileflag .= " -lcv -lhighgui -lcvaux "
    " endif
    " if search("omp\.h") != 0
        " let compileflag .= " -fopenmp "
    " endif
    " if search("math\.h") != 0
        " let compileflag .= " -lm "
    " endif
    " exec compilecmd." % ".compileflag
" endfunc
" func! CompileGpp()
    " exec "w"
    " let compilecmd="!g++ "
    " let compileflag="-o %< "
    " if search("mpi\.h") != 0
        " let compilecmd = "!mpic++ "
    " endif
    " if search("glut\.h") != 0
        " let compileflag .= " -lglut -lGLU -lGL "
    " endif
    " if search("cv\.h") != 0
        " let compileflag .= " -lcv -lhighgui -lcvaux "
    " endif
    " if search("omp\.h") != 0
        " let compileflag .= " -fopenmp "
    " endif
    " if search("math\.h") != 0
        " let compileflag .= " -lm "
    " endif
    " exec compilecmd." % ".compileflag
" endfunc

" func! RunPython()
    " exec "!python %"
" endfunc
" func! CompileJava()
    " exec "!javac %"
" endfunc


" func! CompileCode()
    " exec "w"
    " if &filetype == "cpp"
        " exec "call CompileGpp()"
    " elseif &filetype == "c"
        " exec "call CompileGcc()"
    " elseif &filetype == "python"
        " exec "call RunPython()"
    " elseif &filetype == "java"
        " exec "call CompileJava()"
    " endif
" endfunc

" func! RunResult()
    " exec "w"
    " if search("mpi\.h") != 0
        " exec "!mpirun -np 4 ./%<"
    " elseif &filetype == "cpp"
        " exec "! ./%<"
    " elseif &filetype == "c"
        " exec "! ./%<"
    " elseif &filetype == "python"
        " exec "call RunPython"
    " elseif &filetype == "java"
        " exec "!java %<"
    " endif
" endfunc 

" let g:ft = ''
" function! NERDCommenter_before()
  " if &ft == 'vue'
    " let g:ft = 'vue'
    " let stack = synstack(line('.'), col('.'))
    " if len(stack) > 0
      " let syn = synIDattr((stack)[0], 'name')
      " if len(syn) > 0
        " exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      " endif
    " endif
  " endif
" endfunction
" function! NERDCommenter_after()
  " if g:ft == 'vue'
    " setf vue
    " let g:ft = ''
  " endif
" endfunction

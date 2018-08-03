let mapleader="\<Space>"
set nocompatible
set mouse=a
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
"complier config
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
    exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc


func! CompileCode()
    exec "w"
    if &filetype == "cpp"
        exec "call CompileGpp()"
    elseif &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    endif
endfunc

func! RunResult()
    exec "w"
    if search("mpi\.h") != 0
        exec "!mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "! ./%<"
    elseif &filetype == "c"
        exec "! ./%<"
    elseif &filetype == "python"
        exec "call RunPython"
    elseif &filetype == "java"
        exec "!java %<"
    endif
endfunc 

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

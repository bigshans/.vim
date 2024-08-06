syn keyword amberKeyword if loop ref return fun else then break continue and or not let import from pub main echo as in fail failed status silent nameof is unsafe
syn keyword amberBoolean true false
syn keyword amberNull null

syn match amberComment /^#.*$/
syn match amberCommentLine /\/\/.*$/
syn match amberInt /\<-\=\d\+\>/
syn match amberFloat /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)/
syntax region  amberStringD        start=+"+  skip=+\\\\\|\\$"+  end=+"+
syntax region  amberStringS        start=+'+  skip=+\\\\\|\\$'+  end=+'+
syntax region  amberCommands start=/{/ end=/}/

command -nargs=+ HiLink hi def link <args>

HiLink amberKeyword Keyword
HiLink amberComment Comment
HiLink amberCommentLine Comment
HiLink amberBoolean Boolean
HiLink amberInt Number
HiLink amberFloat Number
HiLink amberStringD String
HiLink amberStringS String
HiLink amberCommands Special


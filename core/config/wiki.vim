let g:wiki_root = '~/notes-wiki'
let g:wiki_mappings_use_defaults = 'all'
let g:wiki_filetypes = ['md', 'wiki']
let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.re_parse = '\v^#\zs[^\w]+$'
let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}
function! s:tag_parser.match(line) dict abort
  return a:line =~# self.re_match
endfunction

function! s:tag_parser.parse(line) dict abort
  let l:tags = []
  let words = filter(split(a:line, '\s'), "!empty(v:val)")

  for word in words
      if word =~# '\v^#\S+$'
          let l:tag = matchstr(word, self.re_parse, 0)
          call add(l:tags, l:tag)
      endif
  endfor

  return l:tags
endfunction

let g:wiki_tag_parsers = [s:tag_parser, g:wiki#tags#default_parser]

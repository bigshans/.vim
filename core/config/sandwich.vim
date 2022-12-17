let g:sandwich#recipes = [
            \   {'buns': ['“', '”'],  'nesting': 1, 'input': ['c"']},
            \   {'buns': ['‘', '’'],  'nesting': 1, 'input': ["c'"]},
            \   {'buns': ['${', '}'], 'nesting': 1, 'input': ['bs']},
            \   {'buns': ['{', '}'], 'nesting': 1, 'input': ['{']},
            \ ]
call extend(g:sandwich#recipes, g:sandwich#default_recipes)
nmap srt <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)tt

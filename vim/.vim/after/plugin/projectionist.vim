let g:projectionist_heuristics = {
\   '*': {
\      '*.cpp': {
\           'alternate': '{}.h',
\           'type': 'source'
\       },
\      'tests/*_test.cpp': {
\           'alternate': ['{}.cpp', '{}.h'],
\           'type': 'test'
\       },
\      '*.c': {
\           'alternate': '{}.h',
\           'type': 'source'
\       },
\       '*.h': {
\           'alternate': ['{}.cpp', '{}.c'],
\           'type': 'header'
\       }
\   }
\}

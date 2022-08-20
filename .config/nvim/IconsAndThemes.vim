let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'absolutepath', 'modified' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'filetype' ],
\              [ 'readonly', ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }

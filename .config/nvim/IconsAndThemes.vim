
" =================================
" ========== for changin the lightline plugin 
" =================================

" syntax on
" filetype plugin on


" 		let g:lightline.component = {
" 		    \ 'mode': '%{lightline#mode()}',
" 		    \ 'absolutepath': '%F',
" 		    \ 'relativepath': '%f',
" 		    \ 'filename': '%t',
" 		    \ 'modified': '%M',
" 		    \ 'bufnum': '%n',
" 		    \ 'paste': '%{&paste?"PASTE":""}',
" 		    \ 'readonly': '%R',
" 		    \ 'charvalue': '%b',
" 		    \ 'charvaluehex': '%B',
" 		    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
" 		    \ 'fileformat': '%{&ff}',
" 		    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
" 		    \ 'percent': '%3p%%',
" 		    \ 'percentwin': '%P',
" 		    \ 'spell': '%{&spell?&spelllang:""}',
" 		    \ 'lineinfo': '%3l:%-2c',
" 		    \ 'line': '%l',
" 		    \ 'column': '%c',
" 		    \ 'close': '%999X X ',
" 		    \ 'winnr': '%{winnr()}' }


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

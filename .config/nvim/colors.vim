
" For the whole terminal
highlight Normal       ctermfg=15  ctermbg=none cterm=none gui=none guibg=none guibg=none

"For the left line of numbers
highlight LineNr       ctermfg=98  ctermbg=235  cterm=bold gui=bold guibg=none guifg=#68018F
"For the current line number of the left
highlight CursorLineNr ctermfg=156 ctermbg=235  cterm=bold gui=bold guibg=none guifg=red
" for the line in a vertival split
highlight VertSplit    ctermfg=98  ctermbg=none  cterm=none gui=none guibg=none guifg=red
 " for statements
highlight Statement    ctermfg=79  ctermbg=none cterm=none gui=bold guibg=none guifg=#00D1FF
 " for Directory color in nerd tree
highlight Directory    ctermfg=21  ctermbg=none cterm=bold gui=bold guibg=none guifg=#0327B0
 " For special characters
highlight Special      ctermfg=1  ctermbg=none cterm=bold gui=bold guibg=none guifg=#850808
		
highlight Comment      ctermfg=166 ctermbg=none cterm=bold gui=italic guibg=none guifg=#5B79DE
"==========  variable types

highlight String    ctermfg=98  ctermbg=none cterm=italic gui=none guibg=none guifg=#FF00E3
highlight Number    ctermfg=1   ctermbg=none cterm=italic gui=none guibg=none guifg=red
highlight Character ctermfg=14  ctermbg=none cterm=italic gui=none guibg=none guifg=#8F6691
highlight Boolean   ctermfg=154 ctermbg=none cterm=bold gui=none guibg=none guifg=red
highlight Float     ctermfg=1   ctermbg=none cterm=none gui=none guibg=none guifg=red
highlight Exception ctermfg=1   ctermbg=none cterm=bold,underline gui=bold,underline guibg=none guibg=red
highlight Repeat    ctermfg=14  ctermbg=none cterm=none gui=bold guibg=none guifg=#00D1FF
highlight Operator  ctermfg=11  ctermbg=none cterm=bold gui=none guibg=none guifg=#F4F67E

" preprocesor
highlight PreProc   ctermfg=14   ctermbg=none    cterm=italic gui=italic guibg=none guifg=#A666CA
highlight Include   ctermfg=14   ctermbg=none    cterm=italic gui=italic guibg=none guifg=#A666CA
highlight Define    ctermfg=14   ctermbg=none    cterm=italic gui=italic guibg=none guifg=#A666CA
highlight Macro     ctermfg=14   ctermbg=none    cterm=italic gui=italic guibg=none guifg=#A666CA
highlight PreCondit ctermfg=14   ctermbg=none    cterm=italic gui=italic guibg=none guifg=#A666CA

" type

" any variable name
highlight Identifier   ctermfg=46  ctermbg=none cterm=bold gui=bold guibg=none guifg=#367236
highlight StorageClass ctermfg=156 ctermbg=none cterm=none gui=bold guibg=none guifg=#367236
highlight Structure    ctermfg=156 ctermbg=none cterm=none gui=bold guibg=none guifg=#367236
highlight Function     ctermfg=14  ctermbg=none cterm=bold gui=bold guibg=none guifg=#367236


" generic groups

highlight Visual       ctermfg=1     ctermbg=11   cterm=none gui=none guifg=white guibg=#5579F0
highlight NonText      ctermfg=162   ctermbg=none cterm=bold,italic gui=bold,italic guibg=none guifg=#CE19E6
highlight SpecialKey   ctermfg=2     ctermbg=none cterm=bold gui=bold guibg=none guifg=#9900FF
highlight SpecialChar  ctermfg=2     ctermbg=none cterm=bold gui=bold guibg=none guifg=#9900FF
highlight TermCursor   ctermfg=235   ctermbg=11   cterm=none gui=none guibg=none guifg=none
highlight TermCursorNC ctermfg=235   ctermbg=15   cterm=none gui=none guibg=none guifg=none
highlight WildMenu     ctermfg=green ctermbg=1    cterm=bold gui=none guibg=none guifg=none


highlight Cursor       ctermfg=1  ctermbg=none cterm=none gui=none guibg=#3BCFD5 guifg=none
highlight CursorIM     ctermfg=1  ctermbg=none cterm=bold gui=none guibg=none guifg=1
highlight CursorColumn ctermfg=none ctermbg=none cterm=italic gui=none guibg=none guifg=none
highlight DiffAdd      ctermfg=1  ctermbg=none cterm=bold gui=bold guifg=1 guibg=none
highlight DiffDelete   ctermfg=84 ctermbg=none cterm=bold gui=bold guifg=84 guibg=none
highlight DiffText     ctermfg=11 ctermbg=none cterm=bold gui=bold guifg=11 guibg=none







" let g:fzf_colors = { 'fg':      ['fg', 'Normal'], 'bg':      ['bg', 'Normal'], 'hl':      ['fg', 'Comment'], 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+':     ['bg', 'CursorLine', 'CursorColumn'], 'hl+':     ['fg', 'Statement'], 'info':    ['fg', 'PreProc'], 'border':  ['fg', 'Ignore'], 'prompt':  ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header':  ['fg', 'Comment'] }
" highlight String    ctermfg=98  ctermbg=none cterm=italic
" highlight Number    ctermfg=1   ctermbg=none cterm=italic
" highlight Character ctermfg=14  ctermbg=none cterm=italic
" highlight Boolean   ctermfg=154 ctermbg=none cterm=bold
" highlight Float     ctermfg=1   ctermbg=none cterm=none
" highlight Exception ctermfg=1   ctermbg=none cterm=bold
" highlight Repeat    ctermfg=14  ctermbg=none cterm=none
" highlight Operator  ctermfg=11  ctermbg=none cterm=bold
" 
" " preprocesor
" highlight Include   ctermfg=14   ctermbg=none    cterm=italic
" highlight Define    ctermfg=14   ctermbg=none    cterm=italic
" highlight Macro     ctermfg=14   ctermbg=none    cterm=italic
" highlight PreCondit ctermfg=14   ctermbg=none    cterm=italic
" 
" " type
" 
" highlight StorageClass ctermfg=156 ctermbg=none cterm=none
" highlight Structure    ctermfg=156 ctermbg=none cterm=none
" highlight Function     ctermfg=14  ctermbg=none cterm=bold
" 
" 
" " generic groups
" 
" highlight Visual       ctermfg=1     ctermbg=11   cterm=italic
" highlight NonText      ctermfg=162   ctermbg=none cterm=bold,italic
" highlight SpecialKey   ctermfg=2     ctermbg=none cterm=bold
" highlight SpecialChar  ctermfg=2     ctermbg=none cterm=bold
" highlight TermCursor   ctermfg=235   ctermbg=11   cterm=none
" highlight TermCursorNC ctermfg=235   ctermbg=15   cterm=none
" highlight WildMenu     ctermfg=green ctermbg=1    cterm=bold
" 
" 
" highlight Cursor       ctermfg=1  ctermbg=none cterm=bold
" highlight CursorIM     ctermfg=1  ctermbg=none cterm=bold
" highlight CursorColumn ctermfg=none ctermbg=none cterm=italic
" highlight DiffAdd      ctermfg=1  ctermbg=none cterm=bold
" highlight DiffDelete   ctermfg=84 ctermbg=none cterm=bold
" highlight DiffText     ctermfg=11 ctermbg=none cterm=bold
" 
" 
" 
" 
" 
" 
" 
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

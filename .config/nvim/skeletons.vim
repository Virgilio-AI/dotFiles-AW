" =================================
" ========== assembly  
" =================================
augroup assembly_avr
	autocmd!
	autocmd BufEnter *.asm ExpandSkeleton sk
augroup END
" =================================
" ========== for html files 
" =================================
augroup html
	autocmd!
	autocmd BufEnter *.html :ExpandSkeleton sk
augroup END
" =================================
" ========== markdown template 
" =================================
augroup markDown
	autocmd!
	autocmd BufEnter *.md :ExpandSkeleton sk
augroup END
" =================================
" ========== zsh squeleton 
" =================================
augroup zshSkeleton
	autocmd!
	autocmd BufEnter *.zsh :ExpandSkeleton sk
augroup END
" =================================
" ========== python 
" =================================
augroup pythonSkeleton
	autocmd!
	autocmd BufEnter *.py\(.sync.py\|.sync.sync.py\)\@<! :ExpandSkeleton sk
augroup END
" =================================
" ========== for databases 
" =================================
augroup mariadb_skeleton
	autocmd!
	autocmd BufEnter *.sql :ExpandSkeleton info
augroup END
" =================================
" ========== for json files 
" =================================
augroup json_skeleton
	autocmd!
	autocmd BufEnter *.json :ExpandSkeleton sk
augroup END
" =================================
" ========== avr skeletons 
" =================================
augroup avr_skeleton
	autocmd!
	autocmd! BufEnter *.avr.c :ExpandSkeleton sk_avr
augroup END
" =================================
" ========== sql skeletons 
" =================================
augroup sql_squeletons
	autocmd!
	autocmd! BufEnter *.sql :ExpandSkeleton sk
augroup END
" =================================
" ========== c squeleton 
" =================================
augroup c_squeleton
	autocmd!
	autocmd BufEnter *.c :ExpandSkeleton sk
augroup END

" =================================
" ========== zsh squeleton 
" =================================
augroup zshSkeleton
	autocmd!
	autocmd BufEnter *.zsh call ExpandSkeleton('sk')
augroup END

" =================================
" ========== python 
" =================================
augroup pythonSkeleton
	autocmd!
	autocmd BufEnter *.py\(.sync.py\|.sync.sync.py\)\@<! call ExpandSkeleton('sk')
augroup END



" =================================
" ========== for databases 
" =================================
augroup mariadb_skeleton
	autocmd!
	autocmd BufEnter *.sql call ExpandSkeleton('info')
augroup END



" =================================
" ========== sql skeletons 
" =================================

augroup sql_squeletons
	autocmd!
	autocmd! BufEnter *.sql call ExpandSkeleton('sk')
augroup END

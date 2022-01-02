
" =================================
" ========== vim skeletons
" =================================

" =================================
" ========== elm skeletons 
" =================================

augroup elm_skeleton
	autocmd!
	autocmd BufEnter */src/Main.elm call ExpandSkeleton('sk')
augroup END

" =================================
" ========== cpp skeletons 
" =================================


augroup codeForces_sk
	autocmd!
	autocmd BufEnter */codeForces/*.cpp call ExpandSkeleton('sk')
augroup END

augroup leetCode_sk
	autocmd!
	autocmd BufEnter */leetCode/*.cpp call ExpandSkeleton('leetCode')
augroup END


augroup cpp
	autocmd!
	autocmd BufEnter */dataStructuresAndAlgos/*/*.cpp call ExpandSkeleton('sk')
augroup END

augroup cpp_main
	autocmd!
	autocmd BufEnter *.cpp call ChooseSkeletonCpp()
augroup END
" =================================
" ========== assembly  
" =================================


augroup assembly_avr
	autocmd!
	autocmd BufEnter *.asm call ExpandSkeleton('sk')
augroup END

augroup assembly_linux
	autocmd!
	autocmd BufEnter *.asm call ExpandSkeleton('sk')
augroup END


augroup assembly_main
	autocmd!
	autocmd BufEnter *.asm call ExpandSkeleton('sk')
augroup END
" =================================
" ========== for html files 
" =================================

augroup html
	autocmd!
	autocmd BufEnter *.html call ExpandSkeleton('sk')
augroup END
" =================================
" ========== markdown template 
" =================================
augroup markDown
	autocmd!
	autocmd BufEnter *.md call ExpandSkeleton('sk')
augroup END

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
" ========== for json files 
" =================================
augroup json_skeleton
	autocmd!
	autocmd BufEnter *.json call ExpandSkeleton('sk')
augroup END

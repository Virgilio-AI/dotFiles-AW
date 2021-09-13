
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
	autocmd BufEnter *.cpp call ChooseSkeleton()
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

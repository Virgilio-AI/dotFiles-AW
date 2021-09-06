
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


augroup hackerRank_sk
	autocmd!
	autocmd BufEnter */hackerRank/*.cpp call ExpandSkeleton('hackerRank')
augroup END

augroup leetCode_sk
	autocmd!
	autocmd BufEnter */leetCode/*.cpp call ExpandSkeleton('leetCode')
augroup END


augroup problems_list
	autocmd!
	autocmd BufEnter */dataStructuresAndAlgos/*/*.cpp call ExpandSkeleton('sk')
augroup END

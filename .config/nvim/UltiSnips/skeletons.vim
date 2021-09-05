
" =================================
" ========== vim skeletons
" =================================

" =================================
" ========== skeletons for elm 
" =================================

 augroup elm_skeletons
 	autocmd!
 	autocmd BufEnter */src/Main.elm
 		\  if getfsize(expand('%'))==0
 		\|	:execute "normal! i sk\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
 		\| endif
 augroup END

" =================================
" ========== skeletons for cpp 
" =================================

 augroup elm_skeletons
 	autocmd!
 	autocmd BufEnter */codeForces/*.cpp
 		\  if getfsize(expand('%'))==0
 		\|	:execute "normal! i sk\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
 		\| endif
 augroup END


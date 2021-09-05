function! ExpandSkeleton(sni)
	let filename = expand('%')
	if !filereadable(filename) ||getfsize (expand('%'))==0
		:execute "normal! i " . a:sni ."\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
	endif
endfunction


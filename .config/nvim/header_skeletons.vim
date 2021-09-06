function! ExpandSkeleton(sni)
	let filename = expand('%')
	if (!filereadable(filename) || getfsize ( expand('%'))==0 ) && getline('$') == '' && line('$') == 1
		:execute "normal! i" . a:sni ."\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
		:startinsert!
	endif
endfunction


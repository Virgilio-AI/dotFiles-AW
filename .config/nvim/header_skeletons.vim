function! ExpandSkeleton(sni)
	let filename = expand('%')
	if (!filereadable(filename) || getfsize ( expand('%'))==0 ) && getline('$') == '' && line('$') == 1
		:execute "normal! i" . a:sni ."\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
		:startinsert!
	endif
endfunction

function! ChooseSkeletonCpp()
	let filename = expand('%')
	if (!filereadable(filename) || getfsize ( expand('%'))==0 ) && getline('$') == '' && line('$') == 1
		let opt = input('(l)eetcode (c)code-forces (h)ackerank (d)ataStructuresAndAlgos\n')
		if opt == "l"
			call ExpandSkeleton('leetcode')
		elseif opt == "c"
			call ExpandSkeleton('sk')
		elseif opt == "h"
			call ExpandSkeleton('hackerRank')
		elseif opt == "d"
			call ExpandSkeleton('sk')
		endif
	endif

endfunction

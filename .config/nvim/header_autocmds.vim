function! CentreCursor()
    let pos = getpos(".")
    normal! zz
    call setpos(".", pos)
endfunction

function! CreateCppDotFiles()
	if !empty(".ccls")
		:!echo "clang++" > .ccls
		:!echo "\%h \%cpp -std=c++17" >> .ccls
	else
	endif
endfunction

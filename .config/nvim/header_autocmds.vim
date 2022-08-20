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

function UpdateModifiable()
  if !exists("b:setmodifiable")
    let b:setmodifiable = 0
  endif
  if &readonly
    if &modifiable
      setlocal nomodifiable
      let b:setmodifiable = 1
    endif
  else
    if b:setmodifiable
      setlocal modifiable
    endif
  endif
endfunction

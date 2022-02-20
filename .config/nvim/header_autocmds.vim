" =================================
" ========== change modifiable 
" =================================

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

" =================================
" ========== patches for plugIns
" =================================
function! s:RandomNamePatch()
	" help feature-list
	if has('win16') || has('win32') || has('win64') || has('win95')
		let l:new_random = strftime("%Y_%m_%d_%H_%M_%S")
		" creates a file like this: `2019-11-12-10-27-10.png`
		" the filesystem on Windows does not allow : character.
	else
		let l:new_random = strftime("%Y_%m_%d_%H_%M_%S")
	endif
	return l:new_random
endfunction



" =================================
" ========== autocommands section 
" =================================

" sudo make 
function! Make()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo make ; sh -c read -n1"
endfunction

" sudo make install
function! MakeInstall()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo make ; sudo make install ; sh -c read -n1 "
endfunction

" sudo make ; sudo make install 
function! MakeMakeInstall()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo make ; sudo make install ; sh -c read -n1 "
endfunction

" cp config.def.h config.h ; sudo make clean install 
function! MakeCleanInstallSuckless()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo cp config.def.h config.h ; sudo make clean install ; sh -c read -n1"
endfunction

" sudo make clean install
function! MakeCleanInstall()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo make clean install ; sh -c read -n1"
endfunction

" dwmblocks
function! DwmblocksInstall()
	:AsyncRun st -T "floating" -g '=150x50+250+100' -e sh -c "sudo cp blocks.def.h blocks.h ; sudo make install && { killall -q dwmblocks;setsid dwmblocks & } ; read -n1 "
endfunction


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

" =================================
" ========== jupyter notbooks 
" =================================

" =================================
" ========== skeletons for vim 
" =================================


" =================================
" ========== clean hacker rank 
" =================================

" =================================
" ========== cop 
" =================================
"
" =================================
" ========== Latex 
" =================================

function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction


function! FormatTheFile()
	execute "normal! ggVG="
endfunction

function! FormatCAvrExit()
	let l:Line = line(".")
	let l:Column = col(".")
	sleep 100m
	:% s/\(\d\)_\(\d\)/\1\2/g
	sleep 100m
	:w!
	sleep 100m
endfunction

function! FormatCAvrEnter()
	let l:Line = line(".")
	let l:Column = col(".")
	sleep 100m
	:% s/0b\(\d\d\d\d\)\(\d\d\d\d\)/0b\1_\2/g
	sleep 100m
	:w!
	sleep 100m
endfunction

" ==================================================
" =========== vimrc ===================
" ==================================================
augroup BufferVariables
"au BufEnter * let b:FilePathNoExtension = expand("%:e") file name no

au BufEnter * let b:FilePathNoExtension = expand("%:r") " path/main
au BufEnter * let b:Extension = expand("%:e") " tex
au BufEnter * let b:FileName = expand("%:t") " main.tex
au BufEnter * let b:FilePath = expand("%") " path/main.tex
au BufEnter * let b:FileNameNoExtension = expand("%:t:r") " main
au BufEnter * let b:CurrentFolder = expand("%:p:h") "pathFolder/folder
augroup end


function! OpenVimrcHeaderRelatedFile()
	let l:name = b:CurrentFolder . "/header_" . b:FileName 
	exe ":split" . l:name
endfunction

" ----------- endvimrc -------------------
"
"
" ==================================================
" =========== For editing beter ===================
" ==================================================
function! SetAbsoluteNumber()
	:set rnu! 
	:set nu
endfunction
function! SetRelativeNumber()
	:set nu
	:set rnu
endfunction

"maximize windows

function! Maximize()
	let l:Line = line(".")
	let l:Column = col(".")
	:tabnew %
	exe "call cursor(" . l:Line . "," . l:Column . ")"
endfunction

function! Minimize()
	let l:Line = line(".")
	let l:Column = col(".")
	:tabclose
	exe "call cursor(" . l:Line . "," . l:Column . ")"
endfunction



" ----------- end For editing beter -------------------
" ==================================================
" =========== Git Commands ===================
" ==================================================
function! LazyGit()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "lazygit"
endfunction
function! GitAddAll()
	:AsyncRun git add .
endfunction
function! GitAddFile()
	:AsyncRun git add %:p
endfunction

function! GitCommit()
	call inputsave()
	let l:commit_message = input('enter commit message: ')
	call inputrestore()
	let l:command = "git commit -m \"" . l:commit_message ."\" ; read -n1"
	:echo l:command
	execute ":AsyncRun st -T \"floating\" -g \"=150x50+250+100\" -e sh -c \"" . l:command . "\""
endfunction

function! GitPushMaster()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "git push origin master"
endfunction

function! GitPushMasterForce()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "git push -f origin master"
endfunction! 

function! GitAddCommitPush()
	:call GitAddAll()
	:sleep 2
	:call GitCommit()
	redraw
	sleep 10
	:call GitPushMaster()
endfunction

function! GitAddCommitPushForce()
	:call GitAddFiles()
	:sleep 2
	:call GitCommit()
	:sleep 10
	redraw
	:call GitPushMasterForce()
endfunction

function! GitStatus()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "git status ; read -n1"
endfunction
function! GitLogOneLine()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "git log --oneline"
endfunction
function! GitLog()
	:AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "git log "
endfunction

" ----------- end Git Commands -------------------



" ==================================================
" =========== Compile and run various code ===================
" ==================================================
" compile and run in c++

function! CompileAndRunCppForCompetition(RunCommand)
if filereadable("runcpp.sh")
	exe ':AsyncRun sh runcpp.sh '
else
	if filereadable("In.txt")
		exe ':AsyncRun st -T "floating" -e sh -c "' . a:RunCommand . ' %:p -o %< && ./%< < In.txt ; read -n1 "'
	else
		exe ':AsyncRun st -T "floating" -e sh -c " nvim In.txt ; ' . a:RunCommand . ' %:p -o %< && ./%< < In.txt ; read -n1"'
	endif
endif
endfunction


function! CompileAndRunCppForNcurses(RunCommand)
	exe ':AsyncRun st -T "floating" -e sh -c " ' . a:RunCommand . ' -lncurses %:p -o %<_nc && ./%<_nc ; read -n1"'
endfunction
function! CompileAndRunCpp(RunCommand)
:w!
if filereadable("In.txt") || filereadable("runcpp.sh")
		:call CompileAndRunCppForCompetition(a:RunCommand)
	else
		if filereadable("%<_nc")
			:call CompileAndRunCppForNcurses(a:RunCommand)
			return
		endif
		let tempChar = input("(c)ompetition-(n)curses: ")
		if tempChar == "c"
			:call CompileAndRunCppForCompetition(a:RunCommand)
		else
			:call CompileAndRunCppForNcurses(a:RunCommand)
		endif
	endif
endfunction

function! GenerateCompileAndRunFile(RunCommand)
	let l:RunCommandInStTerminal='!AsyncRun st -T "floating" -e sh -c '
	let l:openDoublequotes='"'
	let l:closeDoublequotes='"'
	let l:copyGenerationFile='cp ~/.config/nvim/runFileConfigurations/generateRunFile.cpp . ; '
	let l:runConfigurationFile=a:RunCommand . 'generateRunFile.cpp -o generateRunFile && ./generateRunFile'
	let l:runruncpp='sh runcpp.sh'
endfunction

"compile and run latex
function! CompileAndRunProyect()
	:w!
	let l:PdfFile = b:FileNameNoExtension . ".pdf"
	exe 'AsyncRun st -T "floating" -g "=80x45+600+80" -e sh -c "cd %:p:h && pdflatex --shell-escape ' . b:FileName .  '"'
	sleep 4
	exe 'AsyncRun st -T "floating" -g "=80x45+600+80" -e sh -c "cd %:p:h && zathura ' . l:PdfFile . '"'
endfunction

" compile and run single file
function! CompileAndRunSingleFile()
	:w!
	if filereadable('tempFileForConfig.tex')
		echo "there is a tempFileForConfig.tex in the folder, the binding wont work until you delete it"
		return
	endif
	let l:OpenTerminal = 'AsyncRun st -T "floating" -e sh -c '
	let l:CopyConfigFileToCurrentPath = ' cp ~/.config/nvim/runFileConfigurations/configuration.tex . ; '
	let l:CopyFileToMainTex = 'cp ' . b:FileNameNoExtension . '.tex tempFileForConfig.tex ; '
	let l:RunPdfLatex = ' pdflatex --shell-escape configuration.tex ; '
	let l:ChangeNamePdf = ' mv configuration.pdf ' . b:FileNameNoExtension . '.pdf ; '
	let l:removeJunkFiles = ' rm -rfd tempFileForConfig.tex configuration.* _minted-configuration ; '
	let l:OpenPdf = ' zathura ' . b:FileNameNoExtension . '.pdf'
	exe l:OpenTerminal . '"' . l:CopyConfigFileToCurrentPath . l:CopyFileToMainTex . l:RunPdfLatex . l:RunPdfLatex .  l:ChangeNamePdf . l:removeJunkFiles . l:OpenPdf  . '"'
endfunction



" ----------- end Compile and run various code -------------------


" ==================================================
" =========== File operations ===================
" ==================================================
function! GivePermissions()
	exe ":AsyncRun st -e sh -c \"sudo chmod 777 %:p ; sudo chown " . g:USER . " %:p ; sudo chgrp " . g:GROUP . " %:p \" "
endfunction

" ----------- end File operations -------------------
" =================================
" ========== coc functions 
" =================================
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" =================================
" ========== Mark Down 
" =================================


function! CompileAndRunMarkDown()
	let openTerminal = ':AsyncRun st -T "floating" -e sh -c '
	let l:CompileHtmlFile = 'pandoc ' . b:FileNameNoExtension . '.md > ' . b:FileNameNoExtension . '.html ; '
	let l:PrevHtml = 'brave ' . b:FileNameNoExtension . '.html ; '
	let l:removeHtmlFile = 'rm ' . b:FileNameNoExtension . '.html'
	exe openTerminal . '"' . l:CompileHtmlFile . l:PrevHtml . l:removeHtmlFile . '"'
endfunction

" =================================
" ========== elm compile and run 
" =================================
function! CompileToJavaScript()
	let l:ExecuteCommands = ':AsyncRun st -e sh -c '
	let l:CdRootDir = 'cd $(git rev-parse --show-toplevel) ; '
	let l:CompileToJavascript = 'elm make src/Main.elm --output app.js ; '
	let l:RunHtml = 'brave index.html'
	if system('git status | grep fatal') == 'fatal'
		echo "fatal not a git repo"
		return
	endif
	exe l:ExecuteCommands . '"' . l:CdRootDir . l:CompileToJavascript . "read -n1 ; " . l:RunHtml . '"'
endfunction

function! CompileAndRunElm()
	let l:ExecuteCommands = ':AsyncRun st -e sh -c '
	let l:CdRootDir = 'cd $(git rev-parse --show-toplevel) ; '
	let l:CompileElm = 'elm make src/Main.elm ; '
	let l:CompileToJavascript = 'elm make src/Main.elm --output app.js ; '
	let l:RunHtml = 'brave index.html'
	if system('git status | grep fatal') == 'fatal'
		echo "fatal not a git repo"
	else
		if filereadable('../app.js')
			exe l:ExecuteCommands . '"' . l:CdRootDir . l:CompileToJavascript . "read -n1 ; " . l:RunHtml . '"'
		else
			exe l:ExecuteCommands . '"' . l:CdRootDir . l:CompileElm . "read -n1 ; " . l:RunHtml . '"'
		endif
	endif
endfunction
" =================================
" ========== CompileAndRunAssembly 
" =================================

function! CompileAndRunAssemblyCode()
	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")
	let l:Name = expand("%<")
	let l:createOFiles = "nasm -f elf64 " . l:FileName . " ; "
	let l:createExecutable = "ld -s -o " . l:Name . " " . l:Name . ".o ; "
	let l:RunExecutable = "./" . l:Name . " ; "
	exe l:ExecuteCommands . '"' . l:createOFiles . l:createExecutable . l:RunExecutable . "read -n1" '"'
endfunction

function! CleanHackerRankFile()
  execute "% " . 'g/ofstream/d'
  execute "% " . 's/cout/cout/g'
  execute "% " . 'g/.close()/d'
endfunction


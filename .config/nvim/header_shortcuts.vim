" Fecha: 10/October/2021 - Sunday
" Autor: Virgilio Murillo Ochoa
" personal github: Virgilio-AI
" linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
" contact: virgiliomurilloochoa1@gmail.com



" =================================
" ========== helper variables 
" =================================



" =================================
" ========== helper functions for the whole file 
" =================================



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
function! CompileAndRunCppDefault(RunCommand)
	exe ':AsyncRun st -T "floating" -e sh -c "' . a:RunCommand . ' %:p -o %< && ./%< ; read -n1 "'
endfunction

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
		let tempChar = input("(c)ompetition-(n)curses-(d)efault: ")
		if tempChar == "c"
			:call CompileAndRunCppForCompetition(a:RunCommand)
		elseif tempChar == "d"
			:call CompileAndRunCppDefault(a:RunCommand)
		else
			:call CompileAndRunCppForNcurses(a:RunCommand)
		endif
	endif
endfunction

function! GenerateCompileAndRun(RunCommand)
	let l:RunCommandInStTerminal='!AsyncRun st -T "floating" -e sh -c '
	let l:openDoublequotes='"'
	let l:closeDoublequotes='"'
	let l:copyGenerationFile='cp ~/.config/nvim/runFileConfigurations/generateRunFile.cpp . ; '
	let l:runConfigurationFile=a:RunCommand . 'generateRunFile.cpp -o generateRunFile && ./generateRunFile'
	let l:runruncpp='sh runcpp.sh'
endfunction

"compile and run latex
function! CompileAndRunLatexProject()
	:w!
	let l:PdfFile = b:FileNameNoExtension . ".pdf"
	let l:TerminalCall = 'AsyncRun st -T "floating" -g "=80x45+600+80" -e sh -c '
	let l:cdIntoDir = 'cd %:p:h && '
	let l:RunCommand = 'pdflatex --shell-escape ' . b:FileName . ' ; '
	let l:OpenPdf = 'zathura ' . l:PdfFile
	exe l:TerminalCall . '"' . l:cdIntoDir . l:RunCommand  . l:RunCommand . l:OpenPdf . '"'
"	exe 'AsyncRun st -T "floating" -g "=80x45+600+80" -e sh -c "cd %:p:h && pdflatex --shell-escape ' . b:FileName .  '"'
"	sleep 4
"	exe 'AsyncRun st -T "floating" -g "=80x45+600+80" -e sh -c "cd %:p:h && zathura ' . l:PdfFile . '"'
endfunction

" compile and run single file
function! CompileAndRunLatexSingleFile()
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
function! BurnAtmel16()
	:w!
	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")
	let l:Name = expand("%<")
	let l:BurnMicro = 'sudo avrdude -c usbasp -p m16 -B 8Mhz -F -U hfuse:w:0xd9:m -U flash:w:' . l:Name . '.hex'
	exe l:ExecuteCommands . '"' . l:BurnMicro . ' ;  read -n1 ' . '"'
endfunction

function BurnMicroChip()
	:call BurnAtmel16()
endfunction

function! CompileAndRunAssemblyForLinux()
	:w!
	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")
	let l:Name = expand("%<")
	let l:createOFiles = "nasm -F obj -f elf64 " . l:FileName . " ; "
	let l:createExecutable = "ld -s -o " . l:Name . " " . l:Name . ".o ; "
	let l:RunExecutable = "./" . l:Name . " ; "
	exe l:ExecuteCommands . '"' . l:createOFiles . l:createExecutable . l:RunExecutable . "read -n1" '"'
endfunction

function! CompileAndRunAssemblyForAvr()
	sleep 100m
	:% s/\(\d\)_\(\d\)/\1\2/g
	sleep 100m
	:w!
	sleep 100m
	" for burning the microchip
	let l:Name = expand("%<")
	let l:BurnMicro = 'sudo avrdude -c usbasp -p m16 -B 8Mhz -F -U hfuse:w:0xd9:m -U flash:w:' . l:Name . '.hex'
	" for compiling the code
	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%") "' . l:Name . '
	let l:CreateHex = 'avra ' . l:Name . '.asm ; ' " the alternative is gavrasm if you don't need proteus to debug
	" recieve user input to burn the mcirochip
	let l:burn = input("do you want to burn into the phisical microchip(y/n)")
	if l:burn == 'y'
		exe l:ExecuteCommands . '"'  . l:CreateHex  . ' read -n1 ; ' . l:BurnMicro . ' ; read -n1 ' .'"'
	else
		". l:CreateHex . l:moveAndClean
		exe l:ExecuteCommands . '"'  . l:CreateHex  . '  read -n1 ; ' . '"'
	endif
	sleep 100m
	:undo
	sleep 100m
	:w!
endfunction

function! CompileAndRunAssemblyCode()
	let tempchar=input("(l)inux (a)tmega16: ")
	if tempchar == "l"
		:call CompileAndRunAssemblyForLinux()
	else
		:call CompileAndRunAssemblyForAvr()
	endif
endfunction

function! CleanHackerRankFile()
  execute "% " . 'g/ofstream/d'
  execute "% " . 's/cout/cout/g'
  execute "% " . 'g/.close()/d'
endfunction

function! CompileAndRunMarkDown()
	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")

	let l:Temp = expand("%<")
	let l:Name = ""

	let l:chars = split(l:Temp,'\zs')
	let l:strlen = len(l:Temp)
	let l:cont =0
	while l:cont < l:strlen
		if l:cont != 0 || l:chars[l:cont] != '.'
			let l:Name = l:Name . l:chars[l:cont]
		endif
		let l:cont = l:cont + 1
	endwhile

	let l:CreatePandoc = 'pandoc ' . l:FileName. ' -t beamer -o ' . l:Name . '.pdf ; '
	let l:OpenPandoc = ' zathura ' . l:Name . '.pdf '
	exe l:ExecuteCommands . '"' . l:CreatePandoc . l:OpenPandoc . ' ; read -n1 ' . '"'
endfunction


" =================================
" ========== r programming 
" =================================
function! CompileAndRunRCode()

	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")

	let l:FileName_NoExtension = expand("%<")
	let l:runScript = 'Rscript ' . l:FileName . ' '

	exe l:ExecuteCommands . '"' . l:runScript . ' ; read -n1 ' . '"'
endfunction

" =================================
" ========== zsh scripting 
" =================================

function! RunZshScript()

	let l:ExecuteCommands = ':AsyncRun st -T "floating" -e sh -c '
	let l:FileName = expand("%")
	let l:FileName_NoExtension = expand("%<")
	let l:runScript = 'zsh ' . l:FileName . ' '
	exe l:ExecuteCommands . '"' . l:runScript . ' ; read -n1 ' . '"'
endfunction


" =================================
" ========== python 
" =================================


function! g:PythonPasteImage(relpath)
        execute "normal! i" . g:mdip_tmpname[0:0]
        let ipos = getcurpos()
        execute "normal! a" . g:mdip_tmpname[1:] . "='" . a:relpath . "'"
"        call setpos('.', ipos)
"        execute "normal! vt]\<C-g>"
endfunction


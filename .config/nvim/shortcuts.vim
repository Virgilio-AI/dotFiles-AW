" Date: 19/August/2022 - Friday
" Author: Virgilio Murillo Ochoa
" personal github: Virgilio-AI
" linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
" contact: virgiliomurilloochoa1@gmail.com
" web: virgiliomurillo.com





" ==================================================
" =========== For gnitide better ===================
" ================================================== 

" for reversing a string better
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
nnoremap -Y ggVG"+y
nnoremap -p :call PasteCleanNormal()<CR>
vnoremap -p :call PasteCleanVisual()<CR>
vnoremap <c-r> y<ESC>/<c-r>"<CR> 
vnoremap p "_dP
vnoremap d "_d
" for changing folding methods
nnoremap <leader>fi :set foldmethod=indent<CR>
nnoremap <leader>fm :set foldmethod=manual<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
" change surroundings
noremap <leader>[ a[<Esc>h%xi]<Esc>%hx
noremap <leader>] a]<Esc>h%xi[<Esc>%hx
noremap <leader>( a(<Esc>h%xi)<Esc>%hx
noremap <leader>) a)<Esc>h%xi(<Esc>%hx
noremap <leader>{ a{<Esc>h%xi}<Esc>%hx
noremap <leader>} a}<Esc>h%xi{<Esc>%hx
noremap <leader>% a%<Esc>h%xi%<Esc>%hx
"min and maximize windows
nnoremap <leader>hp :vertical resize +30<CR>
nnoremap <leader>hm :vertical resize -30<CR>
nnoremap <leader>vp :res +30<CR>
nnoremap <leader>vm :res -30<CR>
"vim like movements
imap <C-Del> X<Esc>lbce
inoremap <C-BS> <C-w>
inoremap <C-u> <Nop>
nnoremap <C-BS> <C-w>
"maximize windows
noremap -- :call Minimize()<CR>
nnoremap -= :call Maximize()<CR>
" select all
nnoremap -a ggVG
"set number and set relative number
nnoremap -n :call SetAbsoluteNumber()<CR>
nnoremap -r :call SetRelativeNumber()<CR>
" ---------- and For editing better ----------------
augroup file_operations
	execute 'autocmd FileType * nnoremap -fp :call GivePermissions()' 
	execute 'autocmd FileType * inoremap -fp :call GivePermissions()'
augroup end

" ----------- end file operations -------------------

"ulti snips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
noremap <leader>es :UltiSnipsEdit


" ========================Easy allign commands
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction


" cmake commands
let g:cmake_link_compile_commands = 1
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>gt :GTestRunUnderCursor<cr>

" =================================
" ========== Run elm projects and files 
" =================================


" =================================
" ========== browser search 
" =================================

nnoremap gx :AsyncRun st -e sh -c "brave <c-r><c-a>"


autocmd FileType python nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" =================================
" ========== python bindings 
" =================================
augroup PYTHON
	autocmd BufEnter *.py nnoremap ff :call FormatPythonCode()<CR>
	exe 'autocmd BufEnter *.py nnoremap <leader>df :w<CR>:AsyncRun st -T "floating" -g "=150x50" -e sh -c "python -m pudb %:p"'
augroup END

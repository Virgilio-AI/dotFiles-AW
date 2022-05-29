" Fecha: 10/October/2021 - Sunday
" Autor: Virgilio Murillo Ochoa
" personal github: Virgilio-AI
" linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
" contact: virgiliomurilloochoa1@gmail.com


" =================================
" ========== print file
" =================================
nnoremap <leader>pp :call PrintFile()


" =================================
" ========== Paste commands 
" =================================


augroup markdown
	autocmd!
	autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
augroup END


" =================================
" ========== Shortcuts file
" =================================
function! CreateRangerBindings()
	exec 'nnoremap <F6>3 :AsyncRun st -T "floating" -g "=150x50+250+100" -e sh -c "ranger" '
	exec 'nnoremap <F6><F6> :FloatermNew ranger "' . expand('%:p:h') . '"<cr>'
endfunction
" open file manager
augroup openRanger
	autocmd!
	autocmd BufEnter * call CreateRangerBindings()
	" open terminal
	exe 'nnoremap <F6>0 :AsyncRun sh -c "cd %:p:h ; st -T "floating" -g "=80x45+600+80"" '
augroup END
" ==================================================
" =========== vimrc ===================
" ==================================================

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
exe "nnoremap <leader>evs :vsplit " . g:CONFIG_PATH . '/shortcuts.vim'  
exe "nnoremap <leader>evS :vsplit " . g:CONFIG_PATH . '/skeletons.vim'
exe "nnoremap <leader>eva :vsplit " . g:CONFIG_PATH . '/autocmds.vim'  
exe "nnoremap <leader>evp :vsplit " . g:CONFIG_PATH . '/PlugIns.vim'
exe "nnoremap <leader>evc :vsplit " . g:CONFIG_PATH . '/colors.vim'
exe "nnoremap <leader>evh :call OpenVimrcHeaderRelatedFile()" 


" ==================================================
" =========== For editing better ===================
" ================================================== 

" delete current line and go to end of previous
inoremap <C-k> <Esc>VxkA
" for reversing a string better
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" for centering vim
"nnoremap j jzz
"nnoremap k kzz

" for copy paste
nnoremap -Y ggVG"+y
" nnoremap -y "+y
" vnoremap -y "+y

" nnoremap -p "+p
" vnoremap -p "+p
"
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

" ==================================================
" =========== Git commands ===================
" ==================================================
nnoremap <leader>gg  :call GitAddCommitPush()
nnoremap <leader>ggf :call GitAddCommitPushForce()
nnoremap <leader>gc  :call GitCommit()
nnoremap <leader>gs  :call GitStatus()
nnoremap <leader>gaa :call GitAddAll()
nnoremap <leader>gaf :call GitAddFile()
nnoremap <leader>lg  :call LazyGit()
nnoremap <leader>lp  :call GitPushMaster()
nnoremap <leader>gd  :Git diff
nnoremap <leader>gdh :Gdiffsplit
nnoremap <leader>gdv :Gvdiffsplit
nnoremap <leader>gvv :Gdiffsplit<CR>l
nnoremap <leader>ghh :Gdiffsplit<CR><Esc>l-ay:q!<CR>:split temp<CR>p
nnoremap <leader>gp  :call GitPushMaster()
nnoremap <leader>gpf :call GitPushMasterForce()
nnoremap <leader>glo :call GitLogOneLine()
nnoremap <leader>gl  :call GitLog()

" ----------- end Git commands -------------------

" ==================================================
"
" =========== File Operations ==========================
" ==================================================

augroup file_operations
	execute 'autocmd FileType * nnoremap -fp :call GivePermissions()' 
	execute 'autocmd FileType * inoremap -fp :call GivePermissions()'
augroup end

" ----------- end file operations -------------------



" =================================
" ========== latex shorcuts 
" =================================

augroup Tex_Shortcuts
	autocmd FileType tex nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
	execute 'autocmd FileType tex nnoremap <F10><F10> <Esc>:w<CR>:LLPStartPreview' 
	execute 'autocmd FileType tex inoremap <F10><F10> <Esc>:w<CR>:LLPStartPreview' 
augroup end

" =================================
" ========== nerdtree 
" =================================

nnoremap <c-b> :NERDTreeToggle<CR>
nnoremap <A-b> :NERDTreeFocus<CR>
"fzf find commands
nnoremap <leader>sp :Files 
execute 'nnoremap <leader>sp :Files %:p:h<CR>'
execute 'nnoremap <leader>sp1 :Files %:p:h:h<CR>'
execute 'nnoremap <leader>sp2 :Files %:p:h:h:h<CR>'
nnoremap <leader>sg :GFiles
nnoremap <leader>sg? :GFiles?
nnoremap <leader>sb :Buffers
nnoremap <leader>sl :Lines
nnoremap <leader>slb :BLines
nnoremap <leader>st :Tags
nnoremap <leader>stb :BTags
nnoremap <leader>sni :Snippets
nnoremap <leader>sc :Commits
nnoremap <leader>scb :BCommits
nnoremap <leader>sm :Maps
nnoremap <leader>sh :History
nnoremap <leader>shc :History/


"vim easy motion map
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"vimspector commands
nnoremap <leader>df :call vimspector#Launch()<CR>
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dx :call vimspector#ClearBreakpoints()<CR>

"ulti snips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
noremap <leader>es :UltiSnipsEdit


" ========================Easy allign commands
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" =================================
" ========== Competitive programing and developing in cpp 
" =================================

" start vim coc bindings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-n>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<C-n>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <C-e> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ----------- end Plug ins key bindings -------------------

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
" ========== bindings for vim and jupyter notebooks 
" =================================
augroup jupyterNoteBook
	autocmd BufEnter *.sync.py nnoremap <space>x :w<CR>:call jupyter_ascending#execute()<CR>:call jupyter_ascending#execute()<CR>
	autocmd BufEnter *.sync.py nnoremap <space>X :w<CR>:call jupyter_ascending#execute_all()<CR>
	autocmd BufEnter *.sync.py nnoremap B $a<CR><Esc>:normal! i# %%<CR>o<Esc>
	autocmd BufEnter *.sync.py nnoremap M $a<CR><Esc>:normal! i# %% [markdown]<CR>o<Esc>
augroup end




" =================================
" ========== coding competitions 
" =================================

augroup hackerRank_clean
	autocmd!
	autocmd BufEnter *.cpp nnoremap <space>h :call CleanHackerRankFile()
augroup END

" =================================
" ========== compile and run html 
" =================================

augroup html_compile
	autocmd!
"	autocmd FileType html nnoremap <F11> :w<CR>:call RunHtml()
	autocmd FileType html nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
augroup END

" =================================
" ========== python bindings 
" =================================
augroup PYTHON
	autocmd BufEnter *.py nnoremap ff :call FormatPythonCode()<CR>
	exe 'autocmd BufEnter *.py nnoremap <leader>df :w<CR>:AsyncRun st -T "floating" -g "=150x50" -e sh -c "python -m pudb %:p"'
augroup END


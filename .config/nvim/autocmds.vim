" creando un comentario de prueba



" =================================
" ========== save folding 
" =================================
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" =================================
" ========== when cursor moved 
" =================================
"augroup onCursorMoved
"	autocmd!
"	autocmd CursorMoved,CursorMovedI * call CentreCursor()
"augroup END
" =================================
" ========== Latex 
" =================================

augroup onEnter
	autocmd!
	au FileType python,tex,c,cpp,c++ :RainbowToggle
"	au BufEnter * :HexokinaseTurnOn

	" Start NERDTree and put the cursor back in the other window.
	autocmd VimEnter * NERDTree | wincmd p

	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

	" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END

" =================================
" ========== vimrc
" =================================


augroup saveChanges
	autocmd!
	exec 'autocmd BufWritePre ' . g:CONFIG_PATH . '/* :so $MYVIMRC'
augroup END

augroup changeModifiable
	autocmd!
	autocmd BufReadPost * call UpdateModifiable()
augroup END
" =================================
" ========== dwm 
" =================================


augroup install_dwm
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dwm/* call MakeCleanInstallSuckless()'
augroup END

augroup install_dwmblocks
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dwmblocks/* call DwmblocksInstall() '
augroup END

augroup install_st
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/st/* call MakeCleanInstallSuckless()'
augroup END

augroup install_dmenu
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/dmenu/* call MakeCleanInstallSuckless()'
augroup END

augroup install_cfiles
	autocmd!
	exec 'autocmd BufWritePre ' . g:SRC_PATH . '/cfiles/* call MakeMakeInstall()'
augroup END



" =================================
" ========== One Vim Plug Startup 
" =================================
" autocmd VimEnter *
"   \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
"   \|   PlugInstall |
"   \| endif
" =================================
" ========== For competitive programing 
" =================================
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


augroup onEnterc
	autocmd!
	au FileType c,cpp call CreateCppDotFiles()
augroup END
" =================================
" ========== for python 
" =================================
augroup python
	autocmd!
	" Add shiftwidth and/or softtabstop if you want to override those too.
	autocmd FileType python setlocal noexpandtab shiftwidth=3 tabstop=3
	autocmd FileType python let g:PasteImageFunction = 'g:PythonPasteImage'

	autocmd FileType python let g:ale_set_hightlihgts = 0
augroup end


" =================================
" ========== install vim plug ins on startup 
" =================================
augroup ViEnter
	autocmd!
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
augroup end
" =================================
" ========== jupyter notebooks autocommands 
" =================================
" augroup jupyterNotebooks
" 	autocmd!
" 	autocmd TextChanged,InsertLeave * :w
" augroup end

" =================================
" ========== configurations for firenvim 
" =================================
augroup frenvim
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter txti.es_*.txt et filetype=typescript
augroup end

" shortcuts for hacker rank
" =================================
" ========== Mark Down 
" =================================
augroup markdown_autocmd
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
augroup END

" =================================
" ========== latex 
" =======================
augroup tex_autocmds
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
augroup END

" =================================
" ========== html 
" =================================
augroup htmlAutoCommands
	autocmd FileType html let g:PasteImageFunction = 'g:HtmlPasteImage'
augroup END

" =================================
" ========== c# 
" =================================
augroup csharpAutoCommands
	autocmd!
  autocmd BufWinEnter *.cs silent! call FormatTheFile()
augroup END


" =================================
" ========== c avr 
" =================================

augroup avr_autocommands
	autocmd!
	autocmd BufEnter *.avr.c silent! call FormatCAvrEnter()
	autocmd BufWinLeave *.avr.c silent! call FormatCAvrExit()
augroup END
